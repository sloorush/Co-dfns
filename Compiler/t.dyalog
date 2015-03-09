:Namespace T
  (⎕IO ⎕ML ⎕WX)←0 1 3
  A←##.A ⋄ d←A.d ⋄ t←A.t ⋄ k←A.k ⋄ n←A.n ⋄ r←A.r ⋄ s←A.s ⋄ v←A.v
  FunS←A.FunS ⋄ FexM←A.FexM ⋄ FunM←A.FunM ⋄ AtmM←A.AtmM ⋄ NumM←A.NumM
  ExpS←A.ExpS ⋄ ExpM←A.ExpM ⋄ pp←#.pp
  rn←⊢,∘↓(1+d)↑⍤¯1(+⍀d∘.=∘⍳1+(⌈/0,d))
  rd←⊢,(+/↑∘r∧.(=∨0=⊢)∘⍉∘↑∘r FunS)
  df←(~(+\1=d)∊((1=d)∧(FexM∨FunM)∧0∊⍨n)(/∘⊢)(+\1=d))(⌿∘⊢)⊢
  prf←((≢↑¯1↓(0≠⊢)(/∘⊢)⊢)⍤1↑∘r)⊢
  dua←(FunM∨↓∘prf∊r∘FunS)(⊣(⍀∘⊢)(⊣(⌿∘⊢)0∊⍨n)(0,1↓(¯1⌽⊣)∧⊢=¯1⌽⊢)⊣(⌿∘⊢)d)⊢
  du←(~dua∨(∨/(prf∧.(=∨0=⊢)∘⍉dua(⌿∘⊢)prf)∧↑∘r∧.≥∘⍉dua(⌿∘⊢)↑∘r×0=prf))(⌿∘⊢)⊢
  enc←⊂⊣,∘⊃((⊣,'_',⊢)/(⊂''),(⍕¨(0≠⊢)(/∘⊢)⊢))
  blg←{⍺←⊢ ⋄ ⍺((prf(⌈/(⍳∘≢⊢)×⍤1(1↓⊣)∧.(=∨0=⊢)∘⍉⊢)⍺⍺(⌿∘↑)r)⌷⍤0 2 ⍺⍺(⌿∘⊢)⍵⍵)⍵}
  lfv←⍉∘⍪(1+⊣),(,¨'Var' 'f'),('fn'enc 4⊃⊢),4↓⊢
  lfn←('Fun'≡1⊃⊢)⌷(⊣-⍨∘⊃⊢)((⊂∘⍉∘⍪⊣,1↓⊢),∘⊂(⊣,(,¨'Fex' 'f'),3↓⊢)⍪lfv)⊢
  lfh←(1<(+/⊣))⊃(⊂0↑⊢),∘⊂∘⍉∘⍪1'Fun'0,('fn'enc⊣),(⊂⊣),5↓∘,1↑⊢
  lf←(1↑⊢)⍪∘⊃(⍪/(1,1↓FunM)blg(↑r)(⊂lfh⍪∘⊃(⍪/((¯2+1=(+/⊣))+∘⊃⊢)lfn⍤¯1⊢))⌸1↓⊢)
  pck←{⍺(⍺⍺⌷⍤¯1⍵⍵,∘⍪⍺⍺(⍀∘⊢)⊣)⍵}
  lch←⊣((1+NumM),t,(⊂,'c'),AtmM pck n,r,∘⍪s)(NumM∨AtmM∧1⌽NumM)(⌿∘⊢)⊢
  lcr←d,(↑(↓(⊂'Var'),(⊂,'a'),∘⍪⊣)(NumM∧¯1⌽AtmM)pck(↓t,k,∘⍪n)⊢),r,∘⍪s
  lcv←
  lc←((⊂'lc'),∘⍕¨∘⍳(+/AtmM∧1⌽NumM))((1↑⊢)⍪lch⍪1↓((¯1⌽AtmM)∨∘~NumM)(⌿∘⊢)lcr)⊢
  da←((0∊⍨n)∧AtmM∨FexM∧(⊂∘,'f')∊⍨k)((~⊣)(⌿∘⊢)(d-¯1⌽⊣),1↓[1]⊢)⊢
  fen←(0≡∘⊃n)⌷n,'fe'enc∘⊃r
  fer←(d,(⊂'Var'),(⊂∘,'af'⊃⍨'Fex'≡∘⊃ t),fen,4↓⊢)⍤1
  fev←(((3↑⊢),fen,4↓⊢)⊣)⍪(AtmM∨ExpM∨FexM)⌷⍤¯1⊢,[0.5]fer
  fee←⍪/(⌽(1,1↓AtmM∨ExpM∨FexM)blg⊢((⊂(d-(⊃d)-2⌊∘⊃d),1↓[1]⊢)fev)⌸1↓⊢)
  fe←(⊃⍪/)(+\FunM)(⍪/(⊂1↑⊢),(1↓(+\d=1+∘⊃⊢))fee⌸1↓⊢)⌸⊢
  ce←(+\'Atm' 'Fun' 'Fex' 'Exp'∊⍨t)(,(1↑⊢),∘⊂∘n 1↓⊢)⌸⊢
  val←(n⍳∘∪n),¨⊢(⊢+(≢⊣)×0=⊢)(⌈/(⍳≢)×⍤1(∪n)∘.((⊂⊣)∊⊢)v)
  vag←∧∘~∘(∘.=⍨∘⍳≢)⍨(∘.(((1⌷⊢)>0⌷⊣)∧(0⌷⊢)<1⌷⊣)⍨val)
  vae←(∪n)(⊣,⍤0⊣(⌷⍨⍤1 0)∘⊃((⊢,(⊃(⍳∘≢⊣)~((≢⊢)↑⊣)(/∘⊢)⊢))/∘⌽(⊂⍬),∘↓⊢))vag
  var←((1⌷∘⍉⊣),⊢)⌷⍨(0⌷∘⍉⊣)⍳⊢
  vaf←(vae(ExpM∨AtmM)(⌿∘⊢)⊢)(d,t,k,(⊣var⍤2 0n),r,s,∘⍪(⊂⊣)var⍤2 0¨v)⊢
  va←((⊃⍪/)(1↑⊢),(vaf¨1↓⊢))(1,1↓FunM)⊂[0]⊢
  avb←{(((,¨'⍺⍵')↑⍨1↓⍴)⍪⊢)⍺⌷⍨⍤2 0⊢⍺⍺⍳⍺⍺∩⍨(↓(⌽1+∘⍳0⍳⍨⊢)((≢⊢)↑↑)⍤0 1⊢)⊃r ⍵}
  avh←{⊂⍵,(n⍵)((⍺⍺(⍵⍵ avb)⍵){¯1 0+[0](⍴⍺⍺)⊤(,⍺⍺)⍳(⊂⍺),⍵})¨v⍵}
  av←(⊃⍪/)(+\FunM){⍺((⍺((∪n)(ExpM∨AtmM)(⌿∘⊢)⊢)⌸⍵)avh(r(1↑⍵)⍪FunS ⍵))⌸⍵}⊢
  fsp←,¨'+-×÷|⌊⌈*⍟○!∧∨⍱⍲<≤=≥>≠' ⋄ fsh←⍉⍪2'Scl'0 ⍬ ⍬ 0 ⍬ ⍬
  fss←ExpM∧((,¨'md')∊⍨k)∧fsp∊⍨(↑v)⌷⍤¯1⍨(,¨'md')⍳k ⋄ fsg←1,2≠/fss
  fse←(⊃⍪/)(fsg(/∘⊢)fss∧fsg)(⊣⊃(⊂⊢),(⊂fsh⍪(1+d),1↓[1]⊢))¨fsg⊂[0]⊢
  fs←(⊃⍪/)((((~ExpM∨AtmM)(⌿∘⊢)⊢)⍪(fse(ExpM∨AtmM)(⌿∘⊢)⊢))¨(1,1↓FunM)⊂[0]⊢)
:EndNamespace
