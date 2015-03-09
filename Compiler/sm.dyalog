:Namespace SM
  nl←##.U.nl ⋄ do←##.U.do ⋄ pdo←##.U.pdo ⋄ tl←##.U.tl
  sclm←{(de dt)(ie it)←tl ⍺ ⋄ z←''
    z,←'BOUND sp[15];','rgt->p->RANK'do'sp[i]=rgt->p->SHAPETC[i];'
    z,←'BOUND c=1;','rgt->p->RANK'do'c*=sp[i];'
    z,←'unsigned elt=(rgt->p->ELTYPE==APLLONG?',ie,':',de,');',nl
    z,←'LOCALP tp;tp.p=NULL;int tpused=0;',nl
    z,←'if(rgt==rslt&&rgt->p->ELTYPE!=elt){rslt=&tp;tpused=1;}',nl
    z,←'else if('
    z,←'rslt->p!=NULL&&(rslt->p->RANK!=rgt->p->RANK||rslt->p->ELTYPE!=elt)'
    z,←){',nl
    z,←' relp(rslt);}',nl
    z,←'else if(rslt->p!=NULL){',nl
    b←'if(sp[i]!=rslt->p->SHAPETC[i]){relp(rslt);break;}'
    z,←('rgt->p->RANK'do b),'}',nl
    z,←'if(rslt->p==NULL){getarray(elt,rgt->p->RANK,sp,rslt);}',nl
    z,←'if(rgt->p->ELTYPE==APLLONG){aplint32*src=ARRAYSTART(rgt->p);',nl
    z,←' ',it,'*dst=ARRAYSTART(rslt->p);',('c'pdo ⍵),'}',nl
    z,←'else if(rgt->p->ELTYPE==APLDOUB){double*src=ARRAYSTART(rgt->p);',nl
    z,←' ',dt,'*dst=ARRAYSTART(rslt->p);',('c'pdo ⍵),'}',nl
    z,←'if(tpused){relp(rgt);rgt->p=zap(rslt->p);}',nl
    z}
:EndNamespace
