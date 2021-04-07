﻿:Namespace t0023

 rho←{⍺(⍴⍤1 ¯1)⍵}
 mta←{(0⌷⍺)⍪(1⌷⍺)⍪(2⌷⍺)⍪3↓⍵}
 bas←{(2*16)|0⌷⍵}
 zer←{0=⌈⌿2↓⍵}
 ful←{(bas⍵)⍪1↓⍵}
 isr←{=∘|⍨⊃⍵}
 isb←{0 1∊⍨∊⌈⌿⍵}
 neg←{2⌷⍵}
 top←{+⌿∧⍀(3↓⍵)}
 sg0←{(4↓⍵)⍪⍨(3⌷⍵)-(bas⍵)×2⌷⍵}
 cat←{(⍪⍤¯1)⍵}
 rav←{(,⍤¯1)⍵}
 pic←{(⊃⍤¯1)⍵}
 trn2←{⍺(⍉⍤15 ¯1)⍵}
 cr1←{256⊤↑⊃{⍵,⍨⊂⍺+⊣⌿0 256⊤⊃⍵}/{(¯1↓⍵),⊂⊢/⍵}⊂⍤¯1⊢⍵}
 cr2←{256|↑⊃{⍵,⍨⊂⍺+⌊256÷⍨⊃⍵}/{(¯1↓⍵),⊂⊢/⍵}⊂⍤¯1⊢⍵}
 cr4←{256|↑⊃{(⊆⍵),⍨⊂⍺+⌊256÷⍨⊃⊆⍵}/⊂⍤¯1⊢⍵}
 sb0←?256 8⍴2
 sm0←?128 16 8⍴2
 I00←(8⍴2)⊤⍳256
 sbw←{(⍵∧.=I00)≠.∧sb0}
 smw←{(⍪⍵)≠.∧sm0}
 rnw←{⍺(≠⍤2)smw sbw⍵}
 aew←{⊃rnw/⍵}
 ⍝ u01←{×\1,1↓⍵⍴*○⍺÷⍵}
 ⍝ ff0←{(⍺↑⍵){(⍺+⍵),[1](⍺-⍵)}(⍺↓⍵)×[1]⍨0J1 u01 1⊃⍴⍵}
 ⍝ fft←{(⍴⍵)⍴⊃ff0/(2*⍳2⍟≢⍵),⊂,[.5]⍵}

:EndNamespace
