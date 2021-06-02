:Namespace t0030_tests

⍝ A  B  E  F  G  L  M  N  O  P  V  Z
⍝ 0  1  2  3  4  5  6  7  8  9 10 11

sym_base←0,,¨'⍵' '⍺' '⍺⍺' '⍵⍵'
LF←⎕UCS 10
LFZ←∊LF,⍨⍪

∆0000_TEST←{in←':Namespace' ':EndNamespace'
 d←,0
 t←,3
 k←,0
 n←,0
 exn←⍬
 ext←⍬
 sym←sym_base
 src←LFZ in
 ##.UT.expect←(d t k n) (exn ext) sym src
 ##.codfns.ps in
}

∆0001_TEST←{in←':NamespAce' ':EnDnamespace'
 d←,0
 t←,3
 k←,0
 n←,0
 exn←⍬
 ext←⍬
 sym←sym_base
 src←LFZ in
 ##.UT.expect←(d t k n) (exn ext) sym src
 ##.codfns.ps in
}

:EndNamespace