EXPORT struct cdf_prim_loc {
	unsigned int __count;
	wchar_t **__names;
	struct cell_func *q_signal;
	struct cell_func *q_dr;
	struct cell_moper *q_veach;
	struct cell_doper *q_ambiv;
	struct cell_func_box *squeeze;
	struct cell_func_box *is_simple;
	struct cell_func_box *is_numeric;
	struct cell_func_box *is_char;
	struct cell_func_box *is_integer;
	struct cell_func_box *is_bool;
	struct cell_func_box *max_shp;
	struct cell_func_box *has_nat_vals;
	struct cell_func_box *chk_scl;
	struct cell_func_box *chk_valid_shape;
	struct cell_func_box *both_simple;
	struct cell_func_box *both_numeric;
	struct cell_func_box *both_char;
	struct cell_func_box *both_bool;
	struct cell_moper *numeric;
	struct cell_moper *scalar;
	struct cell_func *rgt;
	struct cell_func *lft;
	struct cell_func *reshape;
	struct cell_func *rho;
	struct cell_func *cat;
	struct cell_func *depth;
	struct cell_func *eqv;
	struct cell_func *nqv;
	struct cell_func *materialize;
	struct cell_func *index;
	struct cell_func *sqd;
	struct cell_func *index_gen;
	struct cell_func *index_of;
	struct cell_func *iot;
	struct cell_func *dis;
	struct cell_func *enclose;
	struct cell_func *par;
	struct cell_func *conjugate;
	struct cell_func *add;
	struct cell_func *negate;
	struct cell_func *sub;
	struct cell_func *sign;
	struct cell_func *mul;
	struct cell_func *recip;
	struct cell_func *div;
	struct cell_func *absolute;
	struct cell_func *residue;
	struct cell_func *res;
	struct cell_func *floor_array;
	struct cell_func *min;
	struct cell_func *max;
	struct cell_func *exp;
	struct cell_func *log;
	struct cell_func *pitimes;
	struct cell_func *cir;
	struct cell_func *binomial;
	struct cell_func *fac;
	struct cell_func *notscl;
	struct cell_func *without;
	struct cell_func *not;
	struct cell_func *logand;
	struct cell_func *and;
	struct cell_func *logor;
	struct cell_func *lor;
	struct cell_func *nan;
	struct cell_func *nor;
	struct cell_func *lessthan;
	struct cell_func *lth;
	struct cell_func *lesseql;
	struct cell_func *lte;
	struct cell_func_box *eql_vec;
	struct cell_func *equal;
	struct cell_func *eql;
	struct cell_func *greatereql;
	struct cell_func *gte;
	struct cell_func *greaterthan;
	struct cell_func *gth;
	struct cell_func *firstocc;
	struct cell_func_box *neq_vec;
	struct cell_func *noteq;
	struct cell_func *neq;
	struct cell_func *split;
	struct cell_func *drop;
	struct cell_func *drp;
	struct cell_func *reverse_last;
	struct cell_func *rotate_last;
	struct cell_func *rot;
	struct cell_func *map_monadic;
	struct cell_moper_box *map_dyadic;
	struct cell_moper *map;
	struct cell_moper_box *reduce;
	struct cell_moper_box *nwreduce;
	struct cell_moper *rdf;
	struct cell_func *rpf;
	struct cell_doper *dot;
	struct cell_doper *pow;
	struct cell_doper *jot;
} cdf_prim;

