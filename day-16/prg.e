pragma.syntax("0.9")


def fromNames := [].asMap().diverge() # string -> int
var names := [].diverge() # list of string
var flows := [].diverge() # list of int
var others := [].diverge() # list of list of string
def matrix := [].diverge()

def filename := interp.getArgs()[0]
def f := <file>[filename]
def contents := f.getText()
for line in contents.split("\n") {
    def l := line.split(" ")
    if (l.size() < 2) {
        continue
    }

    def n := names.size()
    names.push(l[1])

    def f := l[4].split("rate=")[1].split(";")[0]
    flows.push(__makeInt(f))

    def o := [].diverge()
    for i in 9..(l.size()-1) {
        o.push(l[i].split(",")[0])
    }
    others.push(o)
    matrix.push([].diverge())
}

##### SORTING

def flows2 := [].diverge()
for i in 0..(flows.size()-1) {
    flows2.push(i)
}

for i in 0..(flows.size()-1) {
    for j in (i+1)..(flows.size()-1) {
        if (flows[flows2[i]] < flows[flows2[j]]) {
            def tmp := flows2[i]
            flows2[i] := flows2[j]
            flows2[j] := tmp
        }
    }
}

# println(flows2)
def flows3 := flows
flows := [].diverge()
def others3 := others
others := [].diverge()
def names3 := names
names := [].diverge()

for i => f2 in flows2 {
    if (flows3[f2] > 0) {
        flows.push(flows3[f2])
    }
    others.push(others3[f2])
    names.push(names3[f2])
    fromNames[names3[f2]] := i
}

# println(fromNames)

###### END SORTING

# println(others)

for i => other in others {
    for _j => _o in others {
        matrix[i].push(999)
    }
    matrix[i][i] := 0
    for o in other {
        matrix[i][fromNames[o]] := 1
    }
}

# println(matrix)

for k in 0..(matrix.size()-1) {
    for i in 0..(matrix.size()-1) {
        for j in 0..(matrix.size()-1) {
            def ij := matrix[i][j]
            def ik := matrix[i][k]
            def kj := matrix[k][j]
            def ikj := ik + kj

            if (ij > ikj) {
                matrix[i][j] := ikj
            }
        }
    }
}

def indent(n) {
    var s := ""
    for i in 1..(35 - n) {
        s += " "
    }
    return s
}

def run2(matrix, p1, p2, d1, d2, valves, score, remaining, closed, lower) {
    if (remaining <= 1) {
        if (score > lower) {
            return score
        }
        return lower
    }

    # potential speedup
    var upper := score + closed * (remaining - 1)
    if (upper <= lower) {
        return lower
    }

    var sco := score
    var rem := remaining
    var clo := closed

    # println(`${indent(rem)}$rem   At $p1 ($d1) and $p2 ($d2) with score $score`)

    var d1r := d1
    var d2r := d2

    if (p1 < valves.size()) {
        if (d1 == 0) { # d1 arrived
            def f1 := valves[p1]
            rem := remaining - 1;
            def t := f1 * rem
            sco += t
            valves[p1] := -f1
            clo -= f1

            # println(`${indent(rem)}$rem   1 Turned valve of $f1 for total $t with score $sco`)
        } else {
            d1r -= 1
        }
        if (d2 == 0) { # d2 arrived
            def f2 := valves[p2]
            rem := remaining - 1;
            def t := f2 * rem
            sco += t
            valves[p2] := -f2
            clo -= f2

            # println(`${indent(rem)}$rem   2 Turned valve of $f2 for total $t with score $sco`)
        } else {
            d2r -= 1
        }
    }

    # Plan where to go

    var maxScore := sco
    if (lower > maxScore) {
        maxScore := lower
    }

    if (d1 == 0 && d2 != 0) {
        var tried := 0
        for p => v in valves {
            if (p != p2 && v > 0) {
                def d := matrix[p1][p]
                def step := if (d2r < d) {d2r} else {d}

                tried += 1
                maxScore := run2(matrix, p, p2, d - step, d2r - step, valves, sco, rem - step, clo, maxScore)
            }
        }

        if (tried == 0) {
            # go home
            maxScore := run2(matrix, -1, p2, 999, 0, valves, sco, rem - d2r, clo, maxScore)
        }
    } else if (d1 != 0 && d2 == 0) {
        var tried := 0
        for p => v in valves {
            if (p != p1 && v > 0) {
                def d := matrix[p2][p]
                def step := if (d1r < d) {d1r} else {d}

                tried += 1
                maxScore := run2(matrix, p1, p, d1r - step, d - step, valves, sco, rem - step, clo, maxScore)
            }
        }

        if (tried == 0) {
            # go home
            maxScore := run2(matrix, p1, -1, 0, 999, valves, sco, rem - d1r, clo, maxScore)
        }
    } else if (d1 == 0 && d2 == 0) {
        var tried := 0
        var ppp := -1
        for p => v in valves {
            if (v > 0) {
                def d := matrix[p1][p]
                ppp := p
                for pp => vv in valves {
                    if (pp != p && (p1 != p2 || pp > p) && vv > 0) {
                        def dd := matrix[p2][pp]
                        def step := if (dd < d) {dd} else {d}

                        tried += 1
                        maxScore := run2(matrix, p, pp, d - step, dd - step, valves, sco, rem - step, clo, maxScore)
                    }
                }
            }
        }

        if (tried == 0 && ppp >= 0) {
            # 1 goes home
            var d := matrix[p2][ppp]

            maxScore := run2(matrix, -1, ppp, 999, 0, valves, sco, rem - d, clo, maxScore)

            # 2 goes home
            d := matrix[p1][ppp]

            maxScore := run2(matrix, ppp, -1, 0, 999, valves, sco, rem - d, clo, maxScore)
        }
    }

    if (p1 < valves.size()) {
        # undo on backtrack
        if (d1 == 0) {
            valves[p1] := -(valves[p1])
        }
        if (d2 == 0) {
            valves[p2] := -(valves[p2])
        }
    }

    # println(`${indent(rem)}$rem   At $p1 ($d1r) and $p2 ($d2r) returning with $maxScore`)

    return maxScore
}

var closed := 0
for f in flows {
    if (f > 0) {
        closed += f
    }
}

def ts1 := <unsafe:java.lang.makeSystem>.currentTimeMillis()

def s := run2(matrix, fromNames["AA"], fromNames["AA"], 0, 999, flows, 0, 30, closed, 0)
println(s)

def s2 := run2(matrix, fromNames["AA"], fromNames["AA"], 0, 0, flows, 0, 26, closed, 0)
println(s2)

def ts2 := <unsafe:java.lang.makeSystem>.currentTimeMillis()
# println(ts2 - ts1)
