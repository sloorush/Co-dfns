﻿:Require file://t0016.dyalog
:Namespace t0016_tests

 tn←'t0016' ⋄ cn←'c0016'
 cd←⎕NS⍬ ⋄ dy←#.⍎tn

 ∆00_TEST←{#.UT.expect←0
  _←#.⎕EX cn ⋄ 0⊣cd∘←#.c0016←tn #.codfns.Fix ⎕SRC dy}

 _← 'catfirst' 'deal' 'decode' 'depth' 'drop∆R1' 'drop∆R2'
 _,←'drop∆R3' 'encode' 'encode∆Ovr' 'enlist' 'expand' 'expandfirst'
 _,←'find' 'first' 'gradedown' 'gradeup' 'identity' 'index∆R1' 'index∆R2'
 _,←'index∆R3' 'index∆R4'
 _,←'indexgen' 'indexof' 'intersection' 'left' 'match' 'matinv' 'matdiv'
 _,←'membership' 'mix' 'notmatch' 'pick' 'random' 'ravel' 'replicate'
 _,←⊂'replicatefirst'
 _,←'reshape∆R0' 'reshape∆Rv' 'reshape∆Rl' 'reshape∆Rr' 'reshape∆Rs'
 _,←'reverse∆R1' 'reverse∆R2' 'revfirst∆R1' 'revfirst∆R2' 'right'
 _,←'rotate∆S' 'rotate∆R' 'rotate∆T' 'rotate∆U' 'rotfirst∆S'
 _,←'rotfirst∆R' 'rotfirst∆T' 'rotfirst∆U' 'same' 'shape' 'shape∆R2'
 _,←'split' 'table' 'table∆R2' 'take∆R1' 'take∆R2'
 _,←'tally' 'transpose∆R1' 'transpose∆R2' 'union' 'unique'
 bindings←{⍵[⍋⍵;]}↑_

 ∆01_TEST←{#.UT.expect←bindings ⋄ cd.⎕NL 3}

 MK∆T1←{##.UT.expect←(⍎'dy.',⍺⍺)⍵⍵ ⋄ (⍎'cd.',⍺⍺)⍵⍵}
 MK∆T2←{##.UT.expect←⊃(⍎'dy.',⍺⍺)/⍵⍵ ⋄ ⊃(⍎'cd.',⍺⍺)/⍵⍵}
 MK∆T3←{fn tl←⍺⍺ ⋄ nv←⊃(⍎'dy.',fn)/⍵⍵ ⋄ cv←⊃(⍎'cd.',fn)/⍵⍵
  ##.UT.expect←(≢,nv)⍴tl ⋄ ,tl⌈|nv-cv}
 MK∆T4←{fn tl←⍺⍺ ⋄ nv←(⍎'dy.',fn)⍵⍵ ⋄ cv←(⍎'cd.',fn)⍵⍵
  ##.UT.expect←(≢,nv)⍴tl ⋄ ,tl⌈|nv-cv}

∆catfirst∆01_TEST←'catfirst' MK∆T2 (⍬)           (⍬)
∆catfirst∆02_TEST←'catfirst' MK∆T2 (5)           (5)
∆catfirst∆03_TEST←'catfirst' MK∆T2 (⍬)           (5)
∆catfirst∆04_TEST←'catfirst' MK∆T2 (⍬)           (⍳5)
∆catfirst∆05_TEST←'catfirst' MK∆T2 (⍳7)          (⍳5)
∆catfirst∆06_TEST←'catfirst' MK∆T2 (5)           (⍳5)
∆catfirst∆07_TEST←'catfirst' MK∆T2 (2 2⍴5)       (2 2⍴5)
∆catfirst∆08_TEST←'catfirst' MK∆T2 (2 2 3⍴5)     (2 3⍴5)
∆catfirst∆09_TEST←'catfirst' MK∆T2 (2 3⍴5)       (2 2 3⍴⌽⍳12)
∆catfirst∆10_TEST←'catfirst' MK∆T2 (2 3⍴5)       (2 2 3⍴5)
∆catfirst∆11_TEST←'catfirst' MK∆T2 (5)           (2 2⍴5)
∆catfirst∆12_TEST←'catfirst' MK∆T2 (,5 5)        (2 2⍴5)
∆catfirst∆13_TEST←'catfirst' MK∆T2 (,5)          (,5)
∆catfirst∆14_TEST←'catfirst' MK∆T2 (7⍴1 0)       (2 7⍴0 1)
∆catfirst∆15_TEST←'catfirst' MK∆T2 (,5 4)        (2 2⍴1 0 0)
∆catfirst∆16_TEST←'catfirst' MK∆T2 (2 2⍴1 0 0)   (,5 4)
∆catfirst∆17_TEST←'catfirst' MK∆T2 (10 10⍴⌽⍳100) (3 10⍴-⌽⍳30)
∆catfirst∆18_TEST←'catfirst' MK∆T2 (3 10⍴-⌽⍳30)  (10 10⍴⌽⍳100)
∆catfirst∆19_TEST←'catfirst' MK∆T2 (5)           (÷5)
∆catfirst∆20_TEST←'catfirst' MK∆T2 (⍬)           (÷5)
∆catfirst∆21_TEST←'catfirst' MK∆T2 (⍬)           (÷1+⍳5)
∆catfirst∆22_TEST←'catfirst' MK∆T2 (⍳7)          (÷1+⍳5)
∆catfirst∆23_TEST←'catfirst' MK∆T2 (5)           (÷1+⍳5)
∆catfirst∆24_TEST←'catfirst' MK∆T2 (2 2⍴5)       (÷2 2⍴5)
∆catfirst∆25_TEST←'catfirst' MK∆T2 (2 2 3⍴5)     (÷2 3⍴5)
∆catfirst∆26_TEST←'catfirst' MK∆T2 (2 3⍴5)       (÷2 2 3⍴⌽1+⍳12)
∆catfirst∆27_TEST←'catfirst' MK∆T2 (2 3⍴5)       (÷2 2 3⍴5)
∆catfirst∆28_TEST←'catfirst' MK∆T2 (5)           (÷2 2⍴5)
∆catfirst∆29_TEST←'catfirst' MK∆T2 (,5 5)        (÷2 2⍴5)
∆catfirst∆30_TEST←'catfirst' MK∆T2 (,5)          (÷,5)
∆catfirst∆31_TEST←'catfirst' MK∆T2 (?128⍴2)      (?128⍴2)
∆catfirst∆32_TEST←'catfirst' MK∆T2 (?120⍴2)      (?120⍴2)
∆catfirst∆33_TEST←'catfirst' MK∆T2 (?70⍴2)       (?70⍴2)
∆catfirst∆34_TEST←'catfirst' MK∆T2 (5)           (?5 5⍴2)
∆catfirst∆35_TEST←'catfirst' MK∆T2 (5)           (⍬⍴1 0 0 0)
∆catfirst∆36_TEST←'catfirst' MK∆T2 (5)           (⍬⍴0 1 0 1)
∆catfirst∆37_TEST←'catfirst' MK∆T2 (,5 4 3)      (⍬⍴1 0 0 0)
∆catfirst∆38_TEST←'catfirst' MK∆T2 (,5 4 3)      (⍬⍴0 1 0 0)
∆catfirst∆39_TEST←'catfirst' MK∆T2 (?5 5⍴2)      (5)
∆catfirst∆40_TEST←'catfirst' MK∆T2 (⍬⍴1 0 0 0)   (5)
∆catfirst∆41_TEST←'catfirst' MK∆T2 (⍬⍴0 1 0 1)   (5)
∆catfirst∆42_TEST←'catfirst' MK∆T2 (⍬⍴1 0 0 0)   (,5 4 3)
∆catfirst∆43_TEST←'catfirst' MK∆T2 (⍬⍴0 1 0 0)   (,5 4 3)
∆catfirst∆44_TEST←'catfirst' MK∆T2 (÷5)          (÷5)
∆catfirst∆45_TEST←'catfirst' MK∆T2 (÷⍬)          (÷5)
∆catfirst∆46_TEST←'catfirst' MK∆T2 (÷⍬)          (÷1+⍳5)
∆catfirst∆47_TEST←'catfirst' MK∆T2 (÷1+⍳7)       (÷1+⍳5)
∆catfirst∆48_TEST←'catfirst' MK∆T2 (÷5)          (÷1+⍳5)
∆catfirst∆49_TEST←'catfirst' MK∆T2 (÷2 2⍴5)      (÷2 2⍴5)
∆catfirst∆50_TEST←'catfirst' MK∆T2 (÷2 2 3⍴5)    (÷2 3⍴5)
∆catfirst∆51_TEST←'catfirst' MK∆T2 (÷2 3⍴5)      (÷2 2 3⍴⌽1+⍳12)
∆catfirst∆52_TEST←'catfirst' MK∆T2 (÷2 3⍴5)      (÷2 2 3⍴5)
∆catfirst∆53_TEST←'catfirst' MK∆T2 (÷5)          (÷2 2⍴5)
∆catfirst∆54_TEST←'catfirst' MK∆T2 (÷,5 5)       (÷2 2⍴5)
∆catfirst∆55_TEST←'catfirst' MK∆T2 (÷,5)         (÷,5)
∆catfirst∆56_TEST←'catfirst' MK∆T2 (÷5)          (5)
∆catfirst∆57_TEST←'catfirst' MK∆T2 (÷⍬)          (5)
∆catfirst∆58_TEST←'catfirst' MK∆T2 (÷⍬)          (1+⍳5)
∆catfirst∆59_TEST←'catfirst' MK∆T2 (÷1+⍳7)       (1+⍳5)
∆catfirst∆60_TEST←'catfirst' MK∆T2 (÷5)          (1+⍳5)
∆catfirst∆61_TEST←'catfirst' MK∆T2 (÷2 2⍴5)      (2 2⍴5)
∆catfirst∆62_TEST←'catfirst' MK∆T2 (÷2 2 3⍴5)    (2 3⍴5)
∆catfirst∆63_TEST←'catfirst' MK∆T2 (÷2 3⍴5)      (2 2 3⍴⌽1+⍳12)
∆catfirst∆64_TEST←'catfirst' MK∆T2 (÷2 3⍴5)      (2 2 3⍴5)
∆catfirst∆65_TEST←'catfirst' MK∆T2 (÷5)          (2 2⍴5)
∆catfirst∆66_TEST←'catfirst' MK∆T2 (÷,5 5)       (2 2⍴5)
∆catfirst∆67_TEST←'catfirst' MK∆T2 (÷,5)         (,5)
∆catfirst∆68_TEST←'catfirst' MK∆T2 (÷5)          (?5 5⍴2)
∆catfirst∆69_TEST←'catfirst' MK∆T2 (÷5)          (⍬⍴1 0 0 0)
∆catfirst∆70_TEST←'catfirst' MK∆T2 (÷5)          (⍬⍴0 1 0 1)
∆catfirst∆71_TEST←'catfirst' MK∆T2 (,÷5 4 3)     (⍬⍴1 0 0 0)
∆catfirst∆72_TEST←'catfirst' MK∆T2 (,÷5 4 3)     (⍬⍴0 1 0 0)
∆catfirst∆73_TEST←'catfirst' MK∆T2 (?5 5⍴2)      (÷5)
∆catfirst∆74_TEST←'catfirst' MK∆T2 (⍬⍴1 0 0 0)   (÷5)
∆catfirst∆75_TEST←'catfirst' MK∆T2 (⍬⍴0 1 0 1)   (÷5)
∆catfirst∆76_TEST←'catfirst' MK∆T2 (⍬⍴1 0 0 0)   (,÷5 4 3)
∆catfirst∆77_TEST←'catfirst' MK∆T2 (⍬⍴0 1 0 0)   (,÷5 4 3)
∆catfirst∆78_TEST←'catfirst' MK∆T2 (⍬⍴1 0 0 0)   (5 5⍴1 0 0 0)
∆catfirst∆79_TEST←'catfirst' MK∆T2 (5 5⍴1 0 0 0) (⍬⍴1 0 0 0)
∆catfirst∆80_TEST←'catfirst' MK∆T2 (⍬⍴1 0 0 0)   (?5 200⍴2)
∆catfirst∆81_TEST←'catfirst' MK∆T2 (⍬⍴1 0 0 0)   (?5 196⍴2)
∆catfirst∆82_TEST←'catfirst' MK∆T2 (?5 200⍴2)    (⍬⍴1 0 0 0)
∆catfirst∆83_TEST←'catfirst' MK∆T2 (?5 196⍴2)    (⍬⍴1 0 0 0)
∆catfirst∆84_TEST←'catfirst' MK∆T2 3             (0 5⍴⍬)
∆catfirst∆85_TEST←'catfirst' MK∆T2 (0 5⍴⍬)       3

F←{⊃((⎕DR ⍵)645)⎕DR ⍵}
B←{⊃((⎕DR ⍵)11)⎕DR ⍵}

I←{⍬≡⍴⍵:⍵ ⋄ ⊃((⎕DR ⍵)323)⎕DR ⍵}

∆find∆001_TEST←'find' MK∆T2 (⍬)(⍬)
∆find∆002_TEST←'find' MK∆T2 (⍬)(5)
∆find∆003_TEST←'find' MK∆T2 (⍬)(⍳5)
∆find∆004_TEST←'find' MK∆T2 (⍬)(2 2⍴⍳4)
∆find∆005_TEST←'find' MK∆T2 (⍬)(3 3 3⍴⍳9)
∆find∆006_TEST←'find' MK∆T2 (1)(⍬)
∆find∆007_TEST←'find' MK∆T2 (2)(5)
∆find∆008_TEST←'find' MK∆T2 (3)(⍳5)
∆find∆009_TEST←'find' MK∆T2 (4)(2 2⍴⍳4)
∆find∆010_TEST←'find' MK∆T2 (5)(3 3 3⍴⍳9)
∆find∆011_TEST←'find' MK∆T2 (⍳3)(⍬)
∆find∆012_TEST←'find' MK∆T2 (⍳3)(0)
∆find∆013_TEST←'find' MK∆T2 (⍳3)(⍳5)
∆find∆014_TEST←'find' MK∆T2 (⍳3)(2 2⍴⍳4)
∆find∆015_TEST←'find' MK∆T2 (⍳4)(3 3 4⍴1,⍳4)
∆find∆016_TEST←'find' MK∆T2 (2 2⍴⍳4)(⍬)
∆find∆017_TEST←'find' MK∆T2 (2 2⍴⍳4)(0)
∆find∆018_TEST←'find' MK∆T2 (2 2⍴⍳4)(⍳5)
∆find∆019_TEST←'find' MK∆T2 (2 2⍴⍳4)(2 2⍴⍳4)
∆find∆020_TEST←'find' MK∆T2 (2 2⍴3 1 2 3)(3 3 4⍴1,⍳4)

∆gradeup∆01_TEST←'gradeup' MK∆T1 (⍬)
∆gradeup∆02_TEST←'gradeup' MK∆T1 (,1)
∆gradeup∆03_TEST←'gradeup' MK∆T1 (⍳3)
∆gradeup∆04_TEST←'gradeup' MK∆T1 (⌽⍳3)
∆gradeup∆05_TEST←'gradeup' MK∆T1 (?25⍴20)
∆gradeup∆06_TEST←'gradeup' MK∆T1 (?100⍴50)
∆gradeup∆07_TEST←'gradeup' MK∆T1 (10⍴50)
∆gradeup∆08_TEST←'gradeup' MK∆T1 (F ⍬)
∆gradeup∆09_TEST←'gradeup' MK∆T1 (F ,1)
∆gradeup∆10_TEST←'gradeup' MK∆T1 (F ⍳3)
∆gradeup∆11_TEST←'gradeup' MK∆T1 (F ⌽⍳3)
∆gradeup∆12_TEST←'gradeup' MK∆T1 (F ?25⍴20)
∆gradeup∆13_TEST←'gradeup' MK∆T1 (F ?100⍴50)
∆gradeup∆14_TEST←'gradeup' MK∆T1 (F 10⍴50)
∆gradeup∆15_TEST←'gradeup' MK∆T1 (?10 10⍴50)
∆gradeup∆16_TEST←'gradeup' MK∆T1 (?10 10 15⍴50)
∆gradeup∆17_TEST←'gradeup' MK∆T1 (F ?10 10⍴50)
∆gradeup∆18_TEST←'gradeup' MK∆T1 (F ?10 10 15⍴50)

I32←{⍬≡⍴⍵:⍵ ⋄ ⊃((⎕DR ⍵)323)⎕DR ⍵}
I16←{⍬≡⍴⍵:⍵ ⋄ ⊃((⎕DR ⍵)163)⎕DR ⍵}
I8←{⍬≡⍴⍵:⍵ ⋄ ⊃((⎕DR ⍵)83)⎕DR ⍵}

∆intersection∆01_TEST←'intersection' MK∆T2 (⍬)(⍬)
∆intersection∆02_TEST←'intersection' MK∆T2 (1)(⍬)
∆intersection∆03_TEST←'intersection' MK∆T2 (⍳5)(⍬)
∆intersection∆04_TEST←'intersection' MK∆T2 (?10⍴5)(⍬)
∆intersection∆05_TEST←'intersection' MK∆T2 (1)(1)
∆intersection∆06_TEST←'intersection' MK∆T2 (⍬)(1)
∆intersection∆07_TEST←'intersection' MK∆T2 (⍬)(⍳5)
∆intersection∆08_TEST←'intersection' MK∆T2 (⍬)(?10⍴5)
∆intersection∆09_TEST←'intersection' MK∆T2 (1)(⍳5)
∆intersection∆10_TEST←'intersection' MK∆T2 (1)(?10⍴5)
∆intersection∆11_TEST←'intersection' MK∆T2 (⍳5)(⍳5)
∆intersection∆12_TEST←'intersection' MK∆T2 (⍳5)(?10⍴5)
∆intersection∆13_TEST←'intersection' MK∆T2 (⍳5)(20+?10⍴5)
∆intersection∆14_TEST←'intersection' MK∆T2 (10+⍳5)(?10⍴5)
∆intersection∆15_TEST←'intersection' MK∆T2 (?10⍴5)(?10⍴5)
∆intersection∆16_TEST←'intersection' MK∆T2 (10+?10⍴5)(?10⍴5)
∆intersection∆17_TEST←'intersection' MK∆T2 (?10⍴5)(10+?10⍴5)
∆intersection∆18_TEST←'intersection' MK∆T2 (?50⍴100)(?50⍴100)
∆intersection∆19_TEST←'intersection' MK∆T2 (F ⍬)(⍬)
∆intersection∆20_TEST←'intersection' MK∆T2 (F 1)(⍬)
∆intersection∆21_TEST←'intersection' MK∆T2 (F ⍳5)(⍬)
∆intersection∆22_TEST←'intersection' MK∆T2 (F ?10⍴5)(⍬)
∆intersection∆23_TEST←'intersection' MK∆T2 (F 1)(1)
∆intersection∆24_TEST←'intersection' MK∆T2 (F ⍬)(1)
∆intersection∆25_TEST←'intersection' MK∆T2 (F ⍬)(⍳5)
∆intersection∆26_TEST←'intersection' MK∆T2 (F ⍬)(?10⍴5)
∆intersection∆27_TEST←'intersection' MK∆T2 (F 1)(⍳5)
∆intersection∆28_TEST←'intersection' MK∆T2 (F 1)(?10⍴5)
∆intersection∆29_TEST←'intersection' MK∆T2 (F ⍳5)(⍳5)
∆intersection∆30_TEST←'intersection' MK∆T2 (F ⍳5)(?10⍴5)
∆intersection∆31_TEST←'intersection' MK∆T2 (F ⍳5)(20+?10⍴5)
∆intersection∆32_TEST←'intersection' MK∆T2 (F 10+⍳5)(?10⍴5)
∆intersection∆33_TEST←'intersection' MK∆T2 (F ?10⍴5)(?10⍴5)
∆intersection∆34_TEST←'intersection' MK∆T2 (F 10+?10⍴5)(?10⍴5)
∆intersection∆35_TEST←'intersection' MK∆T2 (F ?10⍴5)(10+?10⍴5)
∆intersection∆36_TEST←'intersection' MK∆T2 (F ?50⍴100)(?50⍴100)
∆intersection∆37_TEST←'intersection' MK∆T2 (⍬)(F ⍬)
∆intersection∆38_TEST←'intersection' MK∆T2 (1)(F ⍬)
∆intersection∆39_TEST←'intersection' MK∆T2 (⍳5)(F ⍬)
∆intersection∆40_TEST←'intersection' MK∆T2 (?10⍴5)(F ⍬)
∆intersection∆41_TEST←'intersection' MK∆T2 (1)(F 1)
∆intersection∆42_TEST←'intersection' MK∆T2 (⍬)(F 1)
∆intersection∆43_TEST←'intersection' MK∆T2 (⍬)(F ⍳5)
∆intersection∆44_TEST←'intersection' MK∆T2 (⍬)(F ?10⍴5)
∆intersection∆45_TEST←'intersection' MK∆T2 (1)(F ⍳5)
∆intersection∆46_TEST←'intersection' MK∆T2 (1)(F ?10⍴5)
∆intersection∆47_TEST←'intersection' MK∆T2 (⍳5)(F ⍳5)
∆intersection∆48_TEST←'intersection' MK∆T2 (⍳5)(F ?10⍴5)
∆intersection∆49_TEST←'intersection' MK∆T2 (⍳5)(F 20+?10⍴5)
∆intersection∆50_TEST←'intersection' MK∆T2 (10+⍳5)(F ?10⍴5)
∆intersection∆51_TEST←'intersection' MK∆T2 (?10⍴5)(F ?10⍴5)
∆intersection∆52_TEST←'intersection' MK∆T2 (10+?10⍴5)(F ?10⍴5)
∆intersection∆53_TEST←'intersection' MK∆T2 (?10⍴5)(F 10+?10⍴5)
∆intersection∆54_TEST←'intersection' MK∆T2 (?50⍴100)(?F 50⍴100)
∆intersection∆55_TEST←'intersection' MK∆T2 (F ⍬)(F ⍬)
∆intersection∆56_TEST←'intersection' MK∆T2 (F 1)(F ⍬)
∆intersection∆57_TEST←'intersection' MK∆T2 (F ⍳5)(F ⍬)
∆intersection∆58_TEST←'intersection' MK∆T2 (F ?10⍴5)(F ⍬)
∆intersection∆59_TEST←'intersection' MK∆T2 (F 1)(F 1)
∆intersection∆60_TEST←'intersection' MK∆T2 (F ⍬)(F 1)
∆intersection∆61_TEST←'intersection' MK∆T2 (F ⍬)(F ⍳5)
∆intersection∆62_TEST←'intersection' MK∆T2 (F ⍬)(F ?10⍴5)
∆intersection∆63_TEST←'intersection' MK∆T2 (F 1)(F ⍳5)
∆intersection∆64_TEST←'intersection' MK∆T2 (F 1)(F ?10⍴5)
∆intersection∆65_TEST←'intersection' MK∆T2 (F ⍳5)(F ⍳5)
∆intersection∆66_TEST←'intersection' MK∆T2 (F ⍳5)(F ?10⍴5)
∆intersection∆67_TEST←'intersection' MK∆T2 (F ⍳5)(F 20+?10⍴5)
∆intersection∆68_TEST←'intersection' MK∆T2 (F 10+⍳5)(F ?10⍴5)
∆intersection∆69_TEST←'intersection' MK∆T2 (F ?10⍴5)(F ?10⍴5)
∆intersection∆70_TEST←'intersection' MK∆T2 (F 10+?10⍴5)(F ?10⍴5)
∆intersection∆71_TEST←'intersection' MK∆T2 (F ?10⍴5)(F 10+?10⍴5)
∆intersection∆72_TEST←'intersection' MK∆T2 (F ?50⍴100)(?F 50⍴100)

∆matdiv∆1_TEST←'matdiv' 1e¯12  MK∆T3 (?5 5⍴0) (?5 5⍴0)
∆matdiv∆2_TEST←'matdiv'  MK∆T2 (?5⍴0) (?5⍴0)
∆matdiv∆3_TEST←'matdiv'  MK∆T2 (?5 5⍴0) (?5⍴0)
∆matdiv∆4_TEST←'matdiv' 1e¯9 MK∆T3 (?5⍴0) (?5 5⍴0)
∆matdiv∆5_TEST←'matdiv' 1e¯12 MK∆T3 (?5 3⍴0) (?5 2⍴0)
∆matdiv∆6_TEST←'matdiv'  MK∆T2 (?5⍴0) (?5 2⍴0)
∆matdiv∆7_TEST←'matdiv'  MK∆T2 (?5 3⍴0) (?5⍴0)

∆matinv∆1_TEST←'matinv' 1e¯5 MK∆T4 (?5 5⍴0)
∆matinv∆2_TEST←'matinv' MK∆T1 (?5⍴0)
∆matinv∆3_TEST←'matinv' MK∆T1 (?0)
∆matinv∆4_TEST←'matinv' 1e¯12 MK∆T4 (?5 3⍴0)

∆membership∆001_TEST←'membership' MK∆T2 (⍬)(⍬)
∆membership∆002_TEST←'membership' MK∆T2 (⍬)(1)
∆membership∆003_TEST←'membership' MK∆T2 (⍬)(⍳5)
∆membership∆004_TEST←'membership' MK∆T2 (⍬)(5 5⍴⍳5)
∆membership∆005_TEST←'membership' MK∆T2 (⍬)(5 5 5⍴⍳5)
∆membership∆006_TEST←'membership' MK∆T2 (0)(⍬)
∆membership∆007_TEST←'membership' MK∆T2 (0)(1)
∆membership∆008_TEST←'membership' MK∆T2 (0)(⍳5)
∆membership∆009_TEST←'membership' MK∆T2 (0)(5 5⍴⍳5)
∆membership∆010_TEST←'membership' MK∆T2 (0)(5 5 5⍴⍳5)
∆membership∆011_TEST←'membership' MK∆T2 (3)(⍬)
∆membership∆012_TEST←'membership' MK∆T2 (3)(1)
∆membership∆013_TEST←'membership' MK∆T2 (3)(⍳5)
∆membership∆014_TEST←'membership' MK∆T2 (3)(5 5⍴⍳5)
∆membership∆015_TEST←'membership' MK∆T2 (3)(5 5 5⍴⍳5)
∆membership∆016_TEST←'membership' MK∆T2 (10)(⍬)
∆membership∆017_TEST←'membership' MK∆T2 (10)(1)
∆membership∆018_TEST←'membership' MK∆T2 (10)(⍳5)
∆membership∆019_TEST←'membership' MK∆T2 (10)(5 5⍴⍳5)
∆membership∆020_TEST←'membership' MK∆T2 (10)(5 5 5⍴⍳5)
∆membership∆021_TEST←'membership' MK∆T2 (2 1)(⍬)
∆membership∆022_TEST←'membership' MK∆T2 (2 1)(1)
∆membership∆023_TEST←'membership' MK∆T2 (2 1)(⍳5)
∆membership∆024_TEST←'membership' MK∆T2 (2 1)(5 5⍴⍳5)
∆membership∆025_TEST←'membership' MK∆T2 (2 1)(5 5 5⍴⍳5)
∆membership∆026_TEST←'membership' MK∆T2 (2 2⍴2 1)(⍬)
∆membership∆027_TEST←'membership' MK∆T2 (2 2⍴2 1)(1)
∆membership∆028_TEST←'membership' MK∆T2 (2 2⍴2 1)(⍳5)
∆membership∆029_TEST←'membership' MK∆T2 (2 2⍴2 1)(5 5⍴⍳5)
∆membership∆030_TEST←'membership' MK∆T2 (2 2⍴2 1)(5 5 5⍴⍳5)
∆membership∆031_TEST←'membership' MK∆T2 (2 2⍴2 10)(⍬)
∆membership∆032_TEST←'membership' MK∆T2 (2 2⍴2 10)(1)
∆membership∆033_TEST←'membership' MK∆T2 (2 2⍴2 10)(⍳5)
∆membership∆034_TEST←'membership' MK∆T2 (2 2⍴2 10)(5 5⍴⍳5)
∆membership∆035_TEST←'membership' MK∆T2 (2 2⍴2 10)(5 5 5⍴⍳5)
∆membership∆036_TEST←'membership' MK∆T2 (F ⍬)(⍬)
∆membership∆037_TEST←'membership' MK∆T2 (F ⍬)(1)
∆membership∆038_TEST←'membership' MK∆T2 (F ⍬)(⍳5)
∆membership∆039_TEST←'membership' MK∆T2 (F ⍬)(5 5⍴⍳5)
∆membership∆040_TEST←'membership' MK∆T2 (F ⍬)(5 5 5⍴⍳5)
∆membership∆041_TEST←'membership' MK∆T2 (F 0)(⍬)
∆membership∆042_TEST←'membership' MK∆T2 (F 0)(1)
∆membership∆043_TEST←'membership' MK∆T2 (F 0)(⍳5)
∆membership∆044_TEST←'membership' MK∆T2 (F 0)(5 5⍴⍳5)
∆membership∆045_TEST←'membership' MK∆T2 (F 0)(5 5 5⍴⍳5)
∆membership∆046_TEST←'membership' MK∆T2 (F 3)(⍬)
∆membership∆047_TEST←'membership' MK∆T2 (F 3)(1)
∆membership∆048_TEST←'membership' MK∆T2 (F 3)(⍳5)
∆membership∆049_TEST←'membership' MK∆T2 (F 3)(5 5⍴⍳5)
∆membership∆050_TEST←'membership' MK∆T2 (F 3)(5 5 5⍴⍳5)
∆membership∆051_TEST←'membership' MK∆T2 (F 10)(⍬)
∆membership∆052_TEST←'membership' MK∆T2 (F 10)(1)
∆membership∆053_TEST←'membership' MK∆T2 (F 10)(⍳5)
∆membership∆054_TEST←'membership' MK∆T2 (F 10)(5 5⍴⍳5)
∆membership∆055_TEST←'membership' MK∆T2 (F 10)(5 5 5⍴⍳5)
∆membership∆056_TEST←'membership' MK∆T2 (F 2 1)(⍬)
∆membership∆057_TEST←'membership' MK∆T2 (F 2 1)(1)
∆membership∆058_TEST←'membership' MK∆T2 (F 2 1)(⍳5)
∆membership∆059_TEST←'membership' MK∆T2 (F 2 1)(5 5⍴⍳5)
∆membership∆060_TEST←'membership' MK∆T2 (F 2 1)(5 5 5⍴⍳5)
∆membership∆061_TEST←'membership' MK∆T2 (F 2 2⍴2 1)(⍬)
∆membership∆062_TEST←'membership' MK∆T2 (F 2 2⍴2 1)(1)
∆membership∆063_TEST←'membership' MK∆T2 (F 2 2⍴2 1)(⍳5)
∆membership∆064_TEST←'membership' MK∆T2 (F 2 2⍴2 1)(5 5⍴⍳5)
∆membership∆065_TEST←'membership' MK∆T2 (F 2 2⍴2 1)(5 5 5⍴⍳5)
∆membership∆066_TEST←'membership' MK∆T2 (F 2 2⍴2 10)(⍬)
∆membership∆067_TEST←'membership' MK∆T2 (F 2 2⍴2 10)(1)
∆membership∆068_TEST←'membership' MK∆T2 (F 2 2⍴2 10)(⍳5)
∆membership∆069_TEST←'membership' MK∆T2 (F 2 2⍴2 10)(5 5⍴⍳5)
∆membership∆070_TEST←'membership' MK∆T2 (F 2 2⍴2 10)(5 5 5⍴⍳5)
∆membership∆071_TEST←'membership' MK∆T2 (⍬)(F ⍬)
∆membership∆072_TEST←'membership' MK∆T2 (⍬)(F 1)
∆membership∆073_TEST←'membership' MK∆T2 (⍬)(F ⍳5)
∆membership∆074_TEST←'membership' MK∆T2 (⍬)(F 5 5⍴⍳5)
∆membership∆075_TEST←'membership' MK∆T2 (⍬)(F 5 5 5⍴⍳5)
∆membership∆076_TEST←'membership' MK∆T2 (0)(F ⍬)
∆membership∆077_TEST←'membership' MK∆T2 (0)(F 1)
∆membership∆078_TEST←'membership' MK∆T2 (0)(F ⍳5)
∆membership∆079_TEST←'membership' MK∆T2 (0)(F 5 5⍴⍳5)
∆membership∆080_TEST←'membership' MK∆T2 (0)(F 5 5 5⍴⍳5)
∆membership∆081_TEST←'membership' MK∆T2 (3)(F ⍬)
∆membership∆082_TEST←'membership' MK∆T2 (3)(F 1)
∆membership∆083_TEST←'membership' MK∆T2 (3)(F ⍳5)
∆membership∆084_TEST←'membership' MK∆T2 (3)(F 5 5⍴⍳5)
∆membership∆085_TEST←'membership' MK∆T2 (3)(F 5 5 5⍴⍳5)
∆membership∆086_TEST←'membership' MK∆T2 (10)(F ⍬)
∆membership∆087_TEST←'membership' MK∆T2 (10)(F 1)
∆membership∆088_TEST←'membership' MK∆T2 (10)(F ⍳5)
∆membership∆089_TEST←'membership' MK∆T2 (10)(F 5 5⍴⍳5)
∆membership∆090_TEST←'membership' MK∆T2 (10)(F 5 5 5⍴⍳5)
∆membership∆091_TEST←'membership' MK∆T2 (2 1)(F ⍬)
∆membership∆092_TEST←'membership' MK∆T2 (2 1)(F 1)
∆membership∆093_TEST←'membership' MK∆T2 (2 1)(F ⍳5)
∆membership∆094_TEST←'membership' MK∆T2 (2 1)(F 5 5⍴⍳5)
∆membership∆095_TEST←'membership' MK∆T2 (2 1)(F 5 5 5⍴⍳5)
∆membership∆096_TEST←'membership' MK∆T2 (2 2⍴2 1)(F ⍬)
∆membership∆097_TEST←'membership' MK∆T2 (2 2⍴2 1)(F 1)
∆membership∆098_TEST←'membership' MK∆T2 (2 2⍴2 1)(F ⍳5)
∆membership∆099_TEST←'membership' MK∆T2 (2 2⍴2 1)(F 5 5⍴⍳5)
∆membership∆100_TEST←'membership' MK∆T2 (2 2⍴2 1)(F 5 5 5⍴⍳5)
∆membership∆101_TEST←'membership' MK∆T2 (2 2⍴2 10)(F ⍬)
∆membership∆102_TEST←'membership' MK∆T2 (2 2⍴2 10)(F 1)
∆membership∆103_TEST←'membership' MK∆T2 (2 2⍴2 10)(F ⍳5)
∆membership∆104_TEST←'membership' MK∆T2 (2 2⍴2 10)(F 5 5⍴⍳5)
∆membership∆105_TEST←'membership' MK∆T2 (2 2⍴2 10)(F 5 5 5⍴⍳5)
∆membership∆106_TEST←'membership' MK∆T2 (F ⍬)(F ⍬)
∆membership∆107_TEST←'membership' MK∆T2 (F ⍬)(F 1)
∆membership∆108_TEST←'membership' MK∆T2 (F ⍬)(F ⍳5)
∆membership∆109_TEST←'membership' MK∆T2 (F ⍬)(F 5 5⍴⍳5)
∆membership∆110_TEST←'membership' MK∆T2 (F ⍬)(F 5 5 5⍴⍳5)
∆membership∆111_TEST←'membership' MK∆T2 (F 0)(F ⍬)
∆membership∆112_TEST←'membership' MK∆T2 (F 0)(F 1)
∆membership∆113_TEST←'membership' MK∆T2 (F 0)(F ⍳5)
∆membership∆114_TEST←'membership' MK∆T2 (F 0)(F 5 5⍴⍳5)
∆membership∆115_TEST←'membership' MK∆T2 (F 0)(F 5 5 5⍴⍳5)
∆membership∆116_TEST←'membership' MK∆T2 (F 3)(F ⍬)
∆membership∆117_TEST←'membership' MK∆T2 (F 3)(F 1)
∆membership∆118_TEST←'membership' MK∆T2 (F 3)(F ⍳5)
∆membership∆119_TEST←'membership' MK∆T2 (F 3)(F 5 5⍴⍳5)
∆membership∆120_TEST←'membership' MK∆T2 (F 3)(F 5 5 5⍴⍳5)
∆membership∆121_TEST←'membership' MK∆T2 (F 10)(F ⍬)
∆membership∆122_TEST←'membership' MK∆T2 (F 10)(F 1)
∆membership∆123_TEST←'membership' MK∆T2 (F 10)(F ⍳5)
∆membership∆124_TEST←'membership' MK∆T2 (F 10)(F 5 5⍴⍳5)
∆membership∆125_TEST←'membership' MK∆T2 (F 10)(F 5 5 5⍴⍳5)
∆membership∆126_TEST←'membership' MK∆T2 (F 2 1)(F ⍬)
∆membership∆127_TEST←'membership' MK∆T2 (F 2 1)(F 1)
∆membership∆128_TEST←'membership' MK∆T2 (F 2 1)(F ⍳5)
∆membership∆129_TEST←'membership' MK∆T2 (F 2 1)(F 5 5⍴⍳5)
∆membership∆130_TEST←'membership' MK∆T2 (F 2 1)(F 5 5 5⍴⍳5)
∆membership∆131_TEST←'membership' MK∆T2 (F 2 2⍴2 1)(F ⍬)
∆membership∆132_TEST←'membership' MK∆T2 (F 2 2⍴2 1)(F 1)
∆membership∆133_TEST←'membership' MK∆T2 (F 2 2⍴2 1)(F ⍳5)
∆membership∆134_TEST←'membership' MK∆T2 (F 2 2⍴2 1)(F 5 5⍴⍳5)
∆membership∆135_TEST←'membership' MK∆T2 (F 2 2⍴2 1)(F 5 5 5⍴⍳5)
∆membership∆136_TEST←'membership' MK∆T2 (F 2 2⍴2 10)(F ⍬)
∆membership∆137_TEST←'membership' MK∆T2 (F 2 2⍴2 10)(F 1)
∆membership∆138_TEST←'membership' MK∆T2 (F 2 2⍴2 10)(F ⍳5)
∆membership∆139_TEST←'membership' MK∆T2 (F 2 2⍴2 10)(F 5 5⍴⍳5)
∆membership∆140_TEST←'membership' MK∆T2 (F 2 2⍴2 10)(F 5 5 5⍴⍳5)

∆union∆01_TEST←'union' MK∆T2 (⍬)(⍬)
∆union∆02_TEST←'union' MK∆T2 (1)(⍬)
∆union∆03_TEST←'union' MK∆T2 (⍳5)(⍬)
∆union∆04_TEST←'union' MK∆T2 (?10⍴5)(⍬)
∆union∆05_TEST←'union' MK∆T2 (1)(1)
∆union∆06_TEST←'union' MK∆T2 (⍬)(1)
∆union∆07_TEST←'union' MK∆T2 (⍬)(⍳5)
∆union∆08_TEST←'union' MK∆T2 (⍬)(?10⍴5)
∆union∆09_TEST←'union' MK∆T2 (1)(⍳5)
∆union∆10_TEST←'union' MK∆T2 (1)(?10⍴5)
∆union∆11_TEST←'union' MK∆T2 (⍳5)(⍳5)
∆union∆12_TEST←'union' MK∆T2 (⍳5)(?10⍴5)
∆union∆13_TEST←'union' MK∆T2 (⍳5)(20+?10⍴5)
∆union∆14_TEST←'union' MK∆T2 (10+⍳5)(?10⍴5)
∆union∆15_TEST←'union' MK∆T2 (?10⍴5)(?10⍴5)
∆union∆16_TEST←'union' MK∆T2 (10+?10⍴5)(?10⍴5)
∆union∆17_TEST←'union' MK∆T2 (?10⍴5)(10+?10⍴5)
∆union∆18_TEST←'union' MK∆T2 (?50⍴100)(?50⍴100)
∆union∆19_TEST←'union' MK∆T2 (F ⍬)(⍬)
∆union∆20_TEST←'union' MK∆T2 (F 1)(⍬)
∆union∆21_TEST←'union' MK∆T2 (F ⍳5)(⍬)
∆union∆22_TEST←'union' MK∆T2 (F ?10⍴5)(⍬)
∆union∆23_TEST←'union' MK∆T2 (F 1)(1)
∆union∆24_TEST←'union' MK∆T2 (F ⍬)(1)
∆union∆25_TEST←'union' MK∆T2 (F ⍬)(⍳5)
∆union∆26_TEST←'union' MK∆T2 (F ⍬)(?10⍴5)
∆union∆27_TEST←'union' MK∆T2 (F 1)(⍳5)
∆union∆28_TEST←'union' MK∆T2 (F 1)(?10⍴5)
∆union∆29_TEST←'union' MK∆T2 (F ⍳5)(⍳5)
∆union∆30_TEST←'union' MK∆T2 (F ⍳5)(?10⍴5)
∆union∆31_TEST←'union' MK∆T2 (F ⍳5)(20+?10⍴5)
∆union∆32_TEST←'union' MK∆T2 (F 10+⍳5)(?10⍴5)
∆union∆33_TEST←'union' MK∆T2 (F ?10⍴5)(?10⍴5)
∆union∆34_TEST←'union' MK∆T2 (F 10+?10⍴5)(?10⍴5)
∆union∆35_TEST←'union' MK∆T2 (F ?10⍴5)(10+?10⍴5)
∆union∆36_TEST←'union' MK∆T2 (F ?50⍴100)(?50⍴100)
∆union∆37_TEST←'union' MK∆T2 (⍬)(F ⍬)
∆union∆38_TEST←'union' MK∆T2 (1)(F ⍬)
∆union∆39_TEST←'union' MK∆T2 (⍳5)(F ⍬)
∆union∆40_TEST←'union' MK∆T2 (?10⍴5)(F ⍬)
∆union∆41_TEST←'union' MK∆T2 (1)(F 1)
∆union∆42_TEST←'union' MK∆T2 (⍬)(F 1)
∆union∆43_TEST←'union' MK∆T2 (⍬)(F ⍳5)
∆union∆44_TEST←'union' MK∆T2 (⍬)(F ?10⍴5)
∆union∆45_TEST←'union' MK∆T2 (1)(F ⍳5)
∆union∆46_TEST←'union' MK∆T2 (1)(F ?10⍴5)
∆union∆47_TEST←'union' MK∆T2 (⍳5)(F ⍳5)
∆union∆48_TEST←'union' MK∆T2 (⍳5)(F ?10⍴5)
∆union∆49_TEST←'union' MK∆T2 (⍳5)(F 20+?10⍴5)
∆union∆50_TEST←'union' MK∆T2 (10+⍳5)(F ?10⍴5)
∆union∆51_TEST←'union' MK∆T2 (?10⍴5)(F ?10⍴5)
∆union∆52_TEST←'union' MK∆T2 (10+?10⍴5)(F ?10⍴5)
∆union∆53_TEST←'union' MK∆T2 (?10⍴5)(F 10+?10⍴5)
∆union∆54_TEST←'union' MK∆T2 (?50⍴100)(?F 50⍴100)
∆union∆55_TEST←'union' MK∆T2 (F ⍬)(F ⍬)
∆union∆56_TEST←'union' MK∆T2 (F 1)(F ⍬)
∆union∆57_TEST←'union' MK∆T2 (F ⍳5)(F ⍬)
∆union∆58_TEST←'union' MK∆T2 (F ?10⍴5)(F ⍬)
∆union∆59_TEST←'union' MK∆T2 (F 1)(F 1)
∆union∆60_TEST←'union' MK∆T2 (F ⍬)(F 1)
∆union∆61_TEST←'union' MK∆T2 (F ⍬)(F ⍳5)
∆union∆62_TEST←'union' MK∆T2 (F ⍬)(F ?10⍴5)
∆union∆63_TEST←'union' MK∆T2 (F 1)(F ⍳5)
∆union∆64_TEST←'union' MK∆T2 (F 1)(F ?10⍴5)
∆union∆65_TEST←'union' MK∆T2 (F ⍳5)(F ⍳5)
∆union∆66_TEST←'union' MK∆T2 (F ⍳5)(F ?10⍴5)
∆union∆67_TEST←'union' MK∆T2 (F ⍳5)(F 20+?10⍴5)
∆union∆68_TEST←'union' MK∆T2 (F 10+⍳5)(F ?10⍴5)
∆union∆69_TEST←'union' MK∆T2 (F ?10⍴5)(F ?10⍴5)
∆union∆70_TEST←'union' MK∆T2 (F 10+?10⍴5)(F ?10⍴5)
∆union∆71_TEST←'union' MK∆T2 (F ?10⍴5)(F 10+?10⍴5)
∆union∆72_TEST←'union' MK∆T2 (F ?50⍴100)(?F 50⍴100)

∆unique∆01_TEST←'unique' MK∆T1 (⍬)
∆unique∆02_TEST←'unique' MK∆T1 (1)
∆unique∆03_TEST←'unique' MK∆T1 (⍳5)
∆unique∆04_TEST←'unique' MK∆T1 (10⍴5)
∆unique∆05_TEST←'unique' MK∆T1 (25⍴⍳10)
∆unique∆06_TEST←'unique' MK∆T1 (?50⍴10)
∆unique∆07_TEST←'unique' MK∆T1 (F ⍬)
∆unique∆08_TEST←'unique' MK∆T1 (F 1)
∆unique∆09_TEST←'unique' MK∆T1 (F ⍳5)
∆unique∆10_TEST←'unique' MK∆T1 (F 10⍴5)
∆unique∆11_TEST←'unique' MK∆T1 (F 25⍴⍳10)
∆unique∆12_TEST←'unique' MK∆T1 (F ?50⍴10)
∆unique∆13_TEST←'unique' MK∆T1 (0 0 1 1 1)
∆unique∆14_TEST←'unique' MK∆T1 (1 1 0 0)
∆unique∆15_TEST←'unique' MK∆T1 (0 0 0 0)
∆unique∆16_TEST←'unique' MK∆T1 (1 1 1 1)
∆unique∆17_TEST←'unique' MK∆T1 (0 0 0 1 1 1 1 1)
∆unique∆18_TEST←'unique' MK∆T1 (1 0 0 0 0 1 1 1 1 1)

 ∆∆∆_TEST←{#.UT.expect←,¨0 0 ⋄ _←#.⎕EX¨cn tn ⋄ #.⎕NC¨cn tn}

:EndNamespace
