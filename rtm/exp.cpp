﻿#include "codfns.h"
#include "internal.h"

NM(exp,"exp",1,1,DID,MFD,DFD,MT ,DAD)
ID(exp,1,s32)
DEFN(exp)
SMF(exp,z.v=exp(rv.as(f64)))
SF(exp,z.v=pow(lv.as(f64),rv.as(f64)))
