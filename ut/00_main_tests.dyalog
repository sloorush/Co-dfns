⎕IO ⎕ML←0 1

C←#.Codfns ⋄ LKCL←{⍺ C.LK C.CL ⍵} ⋄ X←{1:#.UT.expect←⍵}

WM1_TEST←{_←X'tmp/test' ⋄ _←C.FI ⋄ 'tmp/test'C.WM C.ModuleCreateWithName⊂'test'}
WM2_TEST←{_←X '; ModuleID = ''test''',⎕UCS 10
  #.utf8get'.ll',⍨'tmp/test'C.WM C.ModuleCreateWithName⊂'test'}
CL1_TEST←{_←X 'ut/F.so' ⋄ C.CL 'ut/F'}
CL2_TEST←{_←X ,⊂'ut/F.so' ⋄ ⎕SH'ls ',C.CL'ut/F'}
Init1_TEST←{_←X 0 ⋄ 1⊃C.Init C.CL'ut/F'}
LK1_TEST←{_←X ,9 ⋄ x←(0 2⍴⍬)C.LK ,'' ⋄ ⎕NC'x'}
LK2_TEST←{_←X ⍉⍪'f' ⋄ ((⍉⍪'f' 2)LKCL 'ut/F').⎕NL 1 2 3 4 9}
LK3_TEST←{_←X ,3 ⋄ ((⍉⍪'f' 2)LKCL'ut/F').⎕NC 'f'}
LK4_TEST←{_←X 5 ⋄ ((⍉⍪'f' 2)LKCL'ut/F'⊣C.FI).f⍬}
LK5_TEST←{_←X 6 ⋄ ((⍉⍪'g' 2)LKCL'ut/G'⊣C.FI).g 5}
LK6_TEST←{_←X 6.5 ⋄ ((⍉⍪'g' 2)LKCL'ut/G'⊣C.FI).g 5.5}
LK7_TEST←{_←X 7 ⋄ 1((⍉⍪'h' 2)LKCL'ut/H'⊣C.FI).h 5}
LK8_TEST←{_←X 7.5 ⋄ 1.5((⍉⍪'h' 2)LKCL'ut/H'⊣C.FI).h 5}
LK9_TEST←{_←X 5 6 ⋄ ((2 2⍴'f' 2 'g' 2)LKCL'ut/FG'⊣C.FI).(f,g)5}
EM_TEST←{_←X 1 ⋄ 11::1 ⋄ #.Codfns.E 11 ⋄ 0}
ED_TEST←{_←X 1 ⋄ 11::1 ⋄ 'a'#.Codfns.E 11 ⋄ 0}
Eachk1_TEST←{⊢ C.Eachk X 1 4⍴0 'a' '' (0 2⍴⍬)}

