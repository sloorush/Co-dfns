﻿NM(fac,"fac",1,1,DID,MFD,DFD,MT ,MT )
fac_f fac_c;
ID(fac,1,s32)
MF(fac_f){z.r=r.r;z.s=r.s;z.v=factorial(r.v.as(f64));}
SF(fac_f,array lvf=lv.as(f64);array rvf=rv.as(f64);
 if(rv.isinteger()&&lv.isinteger()&&
   !anyTrue<I>(sign(lv))&&!anyTrue<I>(sign(rv))){
  z.v=factorial(rvf)/(factorial(lvf)*factorial(rvf-lvf));R;}
 z.v=exp(log(tgamma(lvf))+log(tgamma(rvf))-log(tgamma(lvf+rvf))))

