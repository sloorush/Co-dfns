﻿NM(exp,"exp",1,1,DID,MFD,DFD,MT ,DAD)
ID(exp,1,s32)
exp_f exp_c;
MF(exp_f){z.f=1;z.s=r.s;z.v=exp(r.v.as(f64));}
SF(exp,z.v=pow(lv.as(f64),rv.as(f64)))

