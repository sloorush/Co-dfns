﻿NM(fnd,"fnd",0,0,MT ,MT ,DFD,MT ,MT )
DEFN(fnd)
DF(fnd_f){B lr=rnk(l),rr=rnk(r),rc=cnt(r),lc=cnt(l);
 if(!rc){z=r;R;}z=r;arr zv(rc,b8);zv=0;
 if(lr>rr){z.v=zv;R;}
 DOB(lr,if(l.s[i]>r.s[i]){z.v=zv;R;})
 if(!lc){zv=1;z.v=zv;R;}
 if(lr>4||rr>4)err(16);
 dim4 rs(1),ls(1);DO((I)lr,ls[i]=l.s[i])DO((I)rr,rs[i]=r.s[i])
 dim4 sp;DO(4,sp[i]=rs[i]-ls[i]+1)seq x[4];DO(4,x[i]=seq((D)sp[i]))
 zv=unrav(zv,z.s);zv(x[0],x[1],x[2],x[3])=1;
 arr lv;CVSWITCH(l.v,err(6),lv=unrav(v,l.s),err(16))
 arr rv;CVSWITCH(r.v,err(6),rv=unrav(v,r.s),err(16))
 DO((I)ls[0],I m=i;
  DO((I)ls[1],I k=i;
   DO((I)ls[2],I j=i;
    DO((I)ls[3],zv(x[0],x[1],x[2],x[3])=zv(x[0],x[1],x[2],x[3])
     &(tile(lv(m,k,j,i),sp)
      ==rv(x[0]+(D)m,x[1]+(D)k,x[2]+(D)j,x[3]+(D)i))))))
 z.v=zv;}
