#include <float.h>
#include <limits.h>
#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <arrayfire.h>

#include "internal.h"

enum array_type
closest_numeric_array_type(double x)
{
	if (0 <= x && x <= 1)
		return ARR_BOOL;
	
	if (INT16_MIN <= x && x <= INT16_MAX)
		return ARR_SINT;
	
	if (INT32_MIN <= x && x <= INT32_MAX)
		return ARR_INT;
	
	return ARR_DBL;
}

int
cast_values_device(struct cell_array *arr, enum array_type type)
{
	af_array newv;
	int err;
	
	if (arr->type == ARR_NESTED)
		CHK(99, fail, L"Unexpected nested device array.");
	
	CHKAF(af_cast(&newv, arr->values, array_type_af_dtype(type)), fail);
	CHKFN(release_array_data(arr), fail);
	
	arr->type = type;
	arr->values = newv;
	
	err = 0;
	
fail:
	return err;
}

int
cast_values_host(struct cell_array *arr, enum array_type type)
{
	size_t count, in_size, out_size;
	char *buf;
	int err, reuse;
	
	err = 0;	
	count = array_values_count(arr);
	in_size = count * array_element_size(arr);
	out_size = count * array_element_size_type(type);
	reuse = *arr->vrefc == 1 && in_size >= out_size;
	
	if (arr->type == ARR_NESTED)
		reuse = 0;
	
	buf = reuse ? arr->values : malloc(out_size + sizeof(int));
	CHK(buf == NULL, fail, L"Failed to alloc squeeze buffer.");
	
	#define CAST_FAIL(ts, as, fail) \
		CHK(99, fail, L"Cannot cast" as L" to " ts);
	#define CAST_LOOP(stmt, tt, at) {			\
		at *rv = arr->values;				\
		tt *tv = (tt *)buf;				\
								\
		for (size_t i = 0; i < count; i++)		\
			stmt;					\
	}	
	#define CAST_SCL(oper, tt, at) CAST_LOOP(tv[i] = oper(rv[i]), tt, at)
	#define CAST_CELL(oper, tt, at, fail) \
		CAST_LOOP(CHKFN(oper(&tv[i], rv[i]), fail), tt, at)
	#define CAST_real_real(ts, tt, as, at, fail) CAST_SCL((tt), tt, at)
	#define CAST_real_cmpx(ts, tt, as, at, fail) CAST_SCL((tt)cast_real_cmpx, tt, at)
	#define CAST_real_char(ts, tt, as, at, fail) CAST_FAIL(#ts, #as, fail)
	#define CAST_real_cell(ts, tt, as, at, fail) CAST_CELL(get_scalar_##ts, tt, at, fail)
	#define CAST_cmpx_real(ts, tt, as, at, fail) CAST_SCL(cast_cmpx_real, tt, at)
	#define CAST_cmpx_cmpx(ts, tt, as, at, fail) CAST_SCL(, tt, at)
	#define CAST_cmpx_char(ts, tt, as, at, fail) CAST_FAIL(#ts, #as, fail)
	#define CAST_cmpx_cell(ts, tt, as, at, fail) CAST_CELL(get_scalar_##ts, tt, at, fail)
	#define CAST_char_real(ts, tt, as, at, fail) CAST_FAIL(#ts, #as, fail)
	#define CAST_char_cmpx(ts, tt, as, at, fail) CAST_FAIL(#ts, #as, fail)
	#define CAST_char_char(ts, tt, as, at, fail) CAST_SCL((tt), tt, at)
	#define CAST_char_cell(ts, tt, as, at, fail) CAST_CELL(get_scalar_##ts, tt, at, fail)
	#define CAST_cell_real(ts, tt, as, at, fail) CAST_CELL(mk_array_##as, tt, at, fail)
	#define CAST_cell_cmpx(ts, tt, as, at, fail) CAST_CELL(mk_array_##as, tt, at, fail)
	#define CAST_cell_char(ts, tt, as, at, fail) CAST_CELL(mk_array_##as, tt, at, fail)
	#define CAST_cell_cell(ts, tt, as, at, fail) CAST_SCL(, tt, at)
	#define CAST_SWITCH(op, ak, at, as, tk, tt, ts, fail) \
		CAST_##tk##_##ak(ts, tt, as, at, fail)
	
	DYADIC_TYPE_SWITCH(arr->type, type, CAST_SWITCH, , fail);
		
	if (reuse) {
		buf = realloc(buf, out_size + sizeof(int));
		CHK(buf == NULL, fail, L"Failed to realloc squeeze.");
	} else {
		CHKFN(release_array_data(arr), fail);
	}
	
	arr->type = type;
	arr->values = buf;
	arr->vrefc = (unsigned int *)(buf + out_size);
	*arr->vrefc = 1;
	
	return err;
	
fail:
	if (!reuse)
		free(buf);
	
	return err;
}

int
cast_values(struct cell_array *arr, enum array_type type)
{
	int err;
	
	if (arr->type == type)
		return 0;
	
	switch (arr->storage) {
	case STG_DEVICE:
		CHKFN(cast_values_device(arr, type), fail);
		break;
	case STG_HOST:
		CHKFN(cast_values_host(arr, type), fail);
		break;
	default:
		CHK(99, fail, L"Unexpected storage type.");
	}

fail:
	return err;
}

inline int
find_minmax(double *min, double *max, 
    unsigned char *is_real, unsigned char *is_int, struct cell_array *arr)
{
	size_t count;
	void *vals;
	
	count = array_values_count(arr);
	vals = arr->values;
	
	if (arr->storage == STG_DEVICE) {
		int err;
		double real, imag;
		
		if (err = af_min_all(&real, &imag, vals))
			return err;
		
		*min = real;
		*is_real = (imag == 0);
		
		if (err = af_max_all(&real, &imag, vals))
			return err;
		
		*max = real;
		*is_real = (*is_real && (imag == 0));
		
		if (!*is_real) {
			*is_int = 0;
			return 0;
		}
		
		if (err = is_integer_device(is_int, vals))
			return err;
		
		return 0;
	}
	
	if (arr->storage != STG_HOST)
		return 99;
	
	*is_real = 1;
	*is_int = 1;
	*min = DBL_MAX;
	*max = DBL_MIN;
	
#define MINMAX_LOOP(type, tx, expr)		\
	for (size_t i = 0; i < count; i++) {	\
		type t = ((type *)vals)[i];	\
						\
		expr;				\
						\
		if (tx < *min)			\
			*min = tx;		\
		if (tx > *max)			\
			*max = tx;		\
	}
	
	switch (arr->type) {
	case ARR_BOOL:
		MINMAX_LOOP(int8_t,t,)
		break;
	case ARR_SINT:
		MINMAX_LOOP(int16_t,t,)
		break;
	case ARR_INT:
		MINMAX_LOOP(int32_t,t,)
		break;
	case ARR_CHAR8:
		MINMAX_LOOP(uint8_t,t,)
		break;
	case ARR_CHAR16:
		MINMAX_LOOP(uint16_t,t,)
		break;
	case ARR_CHAR32:
		MINMAX_LOOP(uint32_t,t,)
		break;
	case ARR_DBL:
		MINMAX_LOOP(double, t, *is_int = (*is_int && is_integer_dbl(t)))
		break;
	case ARR_CMPX:
		MINMAX_LOOP(struct apl_cmpx, t.real, {
			*is_int = (*is_int && is_integer_dbl(t.real));
			*is_real = (*is_real && (t.imag == 0));
		})
	default:
		return 99;
	}
		
	return 0;
}

int
squeeze_array(struct cell_array *arr)
{
	size_t count;
	double min_real, max_real;
	int err;
	unsigned char is_real, is_int;

	err = 0;
	count = array_count(arr);
	
	if (!count)
		return 0;
	
	if (arr->type == ARR_NESTED) {
		struct cell_array **vals = arr->values;
		enum array_type type = vals[0]->type;
		
		for (size_t i = 0; i < count; i++) {
			struct cell_array *t = vals[i];
			
			if (t->rank !=0 || t->type == ARR_NESTED)
				return 0;
			
			type = array_max_type(type, t->type);
		}
		
		if (err = cast_values(arr, type))
			return err;
		
		if (arr->type == ARR_NESTED)
			return 0;
	}
	
	switch (arr->type) {
	case ARR_SPAN:
	case ARR_BOOL:
	case ARR_CHAR8:
	case ARR_MIXED:
		return 0;
	case ARR_SINT:
	case ARR_INT:
	case ARR_DBL:
	case ARR_CMPX:
	case ARR_CHAR16:
	case ARR_CHAR32:
		break;
	default:
		return 99;
	}
	
	err = find_minmax(&min_real, &max_real, &is_real, &is_int, arr);
	
	if (err)
		return err;
	
	if (!is_real)
		return 0;
	
	if (!is_int)
		return cast_values(arr, ARR_DBL);
	
	if (is_char_array(arr)) {
		if (0 <= min_real && max_real <= UINT8_MAX)
			return cast_values(arr, ARR_CHAR8);
		
		if (0 <= min_real && max_real <= UINT16_MAX)
			return cast_values(arr, ARR_CHAR16);
		
		return 0;
	}
	
	if (0 <= min_real && max_real <= 1)
		return cast_values(arr, ARR_BOOL);
	
	if (INT16_MIN <= min_real && max_real <= INT16_MAX)
		return cast_values(arr, ARR_SINT);
	
	if (INT32_MIN <= min_real && max_real <= INT32_MAX)
		return cast_values(arr, ARR_INT);
	
	return cast_values(arr, ARR_DBL);
}
