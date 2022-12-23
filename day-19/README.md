Follow instructions on `https://www.unison-lang.org/learn/quickstart/`

Run:
```
./unisonlanguage/ucm
.> cd x
.x> fork .base base
.x> load prg.u
.x> add
.x> compile prg prg
.x> quit
unisonlanguage/ucm run.compiled prg.uc -- input
```

[0] 10:04:52 adam AJURASZEK ~/.../personal/advent2022/day-19 $ time unisonlanguage/ucm run.compiled p.uc -- input
trace: BP
DataB2 #2lg4a 3014656 (DataB2 #2lg4a 3014656 (DataU1 ##Nat 1245184 1) (DataB2 #2lg4a 3014656 (DataU1 ##Nat 1245184 36) (DataB2 #2lg4a 3014656 (DataU1 ##Nat 1245184 36) (Enum #00nv2 3080192)))) (DataB2 #2lg4a 3014656 (DataB1 #68k40 4063232 (DataU1 ##Nat 1245184 2769942)) (DataB2 #2lg4a 3014656 (DataG #7th5l 4128768 [] (fromListN 3 [DataU1 ##Nat 1245184 0,DataG #n8q5a 4325376 [] (fromListN 4 [DataU1 ##Nat 1245184 6,DataU1 ##Nat 1245184 5,DataU1 ##Nat 1245184 8,DataU1 ##Nat 1245184 4]),DataG #n8q5a 4325376 [] (fromListN 4 [DataU1 ##Nat 1245184 36,DataU1 ##Nat 1245184 14,DataU1 ##Nat 1245184 90,DataU1 ##Nat 1245184 36])])) (Enum #00nv2 3080192)))
trace: BP
DataB2 #2lg4a 3014656 (DataB2 #2lg4a 3014656 (DataU1 ##Nat 1245184 2) (DataB2 #2lg4a 3014656 (DataU1 ##Nat 1245184 56) (DataB2 #2lg4a 3014656 (DataU1 ##Nat 1245184 112) (Enum #00nv2 3080192)))) (DataB2 #2lg4a 3014656 (DataB1 #68k40 4063232 (DataU1 ##Nat 1245184 5672327)) (DataB2 #2lg4a 3014656 (DataG #7th5l 4128768 [] (fromListN 3 [DataU1 ##Nat 1245184 0,DataG #n8q5a 4325376 [] (fromListN 4 [DataU1 ##Nat 1245184 9,DataU1 ##Nat 1245184 5,DataU1 ##Nat 1245184 5,DataU1 ##Nat 1245184 4]),DataG #n8q5a 4325376 [] (fromListN 4 [DataU1 ##Nat 1245184 56,DataU1 ##Nat 1245184 11,DataU1 ##Nat 1245184 59,DataU1 ##Nat 1245184 21])])) (Enum #00nv2 3080192)))
trace: BP
DataB2 #2lg4a 3014656 (DataB2 #2lg4a 3014656 (DataU1 ##Nat 1245184 3) (DataB2 #2lg4a 3014656 (DataU1 ##Nat 1245184 37) (DataB2 #2lg4a 3014656 (DataU1 ##Nat 1245184 111) (Enum #00nv2 3080192)))) (DataB2 #2lg4a 3014656 (DataB1 #68k40 4063232 (DataU1 ##Nat 1245184 1708148)) (DataB2 #2lg4a 3014656 (DataG #7th5l 4128768 [] (fromListN 3 [DataU1 ##Nat 1245184 0,DataG #n8q5a 4325376 [] (fromListN 4 [DataU1 ##Nat 1245184 7,DataU1 ##Nat 1245184 5,DataU1 ##Nat 1245184 5,DataU1 ##Nat 1245184 4]),DataG #n8q5a 4325376 [] (fromListN 4 [DataU1 ##Nat 1245184 37,DataU1 ##Nat 1245184 11,DataU1 ##Nat 1245184 44,DataU1 ##Nat 1245184 15])])) (Enum #00nv2 3080192)))
trace: quality
DataU1 ##Nat 1245184 74592

real	36m19.850s
user	36m11.867s
sys	0m3.454s
[0] 10:42:09 adam AJURASZEK ~/.../personal/advent2022/day-19 $ time unisonlanguage/ucm run.compiled p.uc -- input
trace: BP   
DataB2 #2lg4a 3014656 (DataB2 #2lg4a 3014656 (DataU1 ##Nat 1245184 1) (DataB2 #2lg4a 3014656 (DataU1 ##Nat 1245184 40) (DataB2 #2lg4a 3014656 (DataU1 ##Nat 1245184 40) (Enum #00nv2 3080192)))) (DataB2 #2lg4a 3014656 (DataB1 #68k40 4063232 (DataU1 ##Nat 1245184 31740628)) (DataB2 #2lg4a 3014656 (DataG #7th5l 4128768 [] (fromListN 3 [DataU1 ##Nat 1245184 0,DataG #n8q5a 4325376 [] (fromListN 4 [DataU1 ##Nat 1245184 7,DataU1 ##Nat 1245184 7,DataU1 ##Nat 1245184 8,DataU1 ##Nat 1245184 4]),DataG #n8q5a 4325376 [] (fromListN 4 [DataU1 ##Nat 1245184 40,DataU1 ##Nat 1245184 19,DataU1 ##Nat 1245184 60,DataU1 ##Nat 1245184 29])])) (Enum #00nv2 3080192)))
trace: BP
DataB2 #2lg4a 3014656 (DataB2 #2lg4a 3014656 (DataU1 ##Nat 1245184 2) (DataB2 #2lg4a 3014656 (DataU1 ##Nat 1245184 58) (DataB2 #2lg4a 3014656 (DataU1 ##Nat 1245184 116) (Enum #00nv2 3080192)))) (DataB2 #2lg4a 3014656 (DataB1 #68k40 4063232 (DataU1 ##Nat 1245184 18907333)) (DataB2 #2lg4a 3014656 (DataG #7th5l 4128768 [] (fromListN 3 [DataU1 ##Nat 1245184 0,DataG #n8q5a 4325376 [] (fromListN 4 [DataU1 ##Nat 1245184 10,DataU1 ##Nat 1245184 6,DataU1 ##Nat 1245184 4,DataU1 ##Nat 1245184 4]),DataG #n8q5a 4325376 [] (fromListN 4 [DataU1 ##Nat 1245184 58,DataU1 ##Nat 1245184 12,DataU1 ##Nat 1245184 47,DataU1 ##Nat 1245184 18])])) (Enum #00nv2 3080192)))
trace: BP
DataB2 #2lg4a 3014656 (DataB2 #2lg4a 3014656 (DataU1 ##Nat 1245184 3) (DataB2 #2lg4a 3014656 (DataU1 ##Nat 1245184 38) (DataB2 #2lg4a 3014656 (DataU1 ##Nat 1245184 114) (Enum #00nv2 3080192)))) (DataB2 #2lg4a 3014656 (DataB1 #68k40 4063232 (DataU1 ##Nat 1245184 4199464)) (DataB2 #2lg4a 3014656 (DataG #7th5l 4128768 [] (fromListN 3 [DataU1 ##Nat 1245184 0,DataG #n8q5a 4325376 [] (fromListN 4 [DataU1 ##Nat 1245184 7,DataU1 ##Nat 1245184 6,DataU1 ##Nat 1245184 7,DataU1 ##Nat 1245184 3]),DataG #n8q5a 4325376 [] (fromListN 4 [DataU1 ##Nat 1245184 38,DataU1 ##Nat 1245184 18,DataU1 ##Nat 1245184 62,DataU1 ##Nat 1245184 21])])) (Enum #00nv2 3080192)))
trace: quality
DataU1 ##Nat 1245184 88160

real	216m43.279s
user	216m1.365s
sys	0m20.427s
