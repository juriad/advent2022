f = sysargv[3]
fc = str2list(read(f))

? len(sim_rope(2, fc))
? len(sim_rope(10, fc))

function sim_rope n, instr
    rope = make_rope(n)
    tails = []
    tails[str_tail(rope)] = 1

    for l in fc
        c = left(l, 1)
        n = 0 + substr(l, 3)

        for i = 1 to n
            rope = move_rope(rope, c)
            t = str_tail(rope)
            tails[t] = 1 + tails[t]
        next
    next
    return tails

function str_tail rope
    tail = rope[len(rope)]
    return "" + tail["x"] + "," + tail["y"]

func make_rope n
    rope = list(n)
    for i = 1 to n
        rope[i] = [:x = 0, :y = 0]
    next
    return rope

func move_knot knot, dir
    switch dir
    on "R"
        return [:x = knot["x"] + 1, :y = knot["y"]]
    on "L"
        return [:x = knot["x"] - 1, :y = knot["y"]]
    on "U"
        return [:x = knot["x"], :y = knot["y"] + 1]
    on "D"
        return [:x = knot["x"], :y = knot["y"] - 1]
    other
        ? "Error " + dir
    off

func follow_knot head, tail
    hx = head["x"]
    hy = head["y"]

    tx = tail["x"]
    ty = tail["y"]

    if hx - tx = 2
        tx += 1
        if hy < ty
            ty -= 1
        but hy > ty
            ty += 1
        ok
    but hx - tx = -2
        tx -= 1
        if hy < ty
            ty -= 1
        but hy > ty
            ty += 1
        ok
    but hy - ty = 2
        ty += 1
        if hx < tx
            tx -= 1
        but hx > tx
            tx += 1
        ok
    but hy - ty = -2
        ty -= 1
        if hx < tx
            tx -= 1
        but hx > tx
            tx += 1
        ok
    ok
    return [:x = tx, :y = ty]

func move_rope rope, dir
    new_rope = list(len(rope))
    k = move_knot(rope[1], dir)
    new_rope[1] = k
    for i = 2 to len(rope)
        k = follow_knot(k, rope[i])
        new_rope[i] = k
    next
    return new_rope

