﻿NM(and,"and",1,1,DID,MT,DFD,MT,DAD)
DEFN(and)
ID(and,1,s32)
SF(and,if(lv.isbool()&&rv.isbool())z.v=lv&&rv;
 else if(allTrue<I>(lv>=0&&lv<=1&&rv>0&&rv<=1))z.v=lv&&rv;
 else{A a(z.s,lv);A b(z.s,rv);
  lor_c(a,a,b,e);z.v=lv.as(f64)*(rv/((!a.v)+a.v));})
