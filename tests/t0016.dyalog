﻿:Namespace t0016

catfirst←{⍺⍪⍵}

find←{⍺⍷⍵}

gradedown←{⍒⍵}

gradeup←{⍋⍵}

indexof←{⍺⍳⍵}

intersection←{⍺∩⍵}

matinv←{⌹⍵}

matdiv←{⍺⌹⍵}

membership←{⍺∊⍵}

reverse∆R1←{⌽⍵} ⋄ reverse∆R2←{⌽⌽⌽⍵}

rotate∆S←{⍺⌽⍵} ⋄ rotate∆R←{7⌽⍵} ⋄ rotate∆T←{¯1⌽⍵}
rotate∆U←{X←0⌷⍺ ⋄ Y←0⌷⍵ ⋄ X⌽Y}

rotfirst∆S←{⍺⊖⍵} ⋄ rotfirst∆R←{7⊖⍵} ⋄ rotfirst∆T←{¯1⊖⍵}
rotfirst∆U←{X←0⌷⍺ ⋄ Y←0⌷⍵ ⋄ X⊖Y}

split←{↓⍵}

transpose∆R1←{⍉⍵} ⋄ transpose∆R2←{⍺⍉⍵}

union←{⍺∪⍵}

unique←{∪⍵}

:EndNamespace
