require "moon.all"

class Bead
    new: (value, index) =>
        @prev = @
        @next = @
        @value = value
        @index = index
        @first = index == 1

    insert_after: (bead) =>
        @prev = bead
        @next = bead.next
        bead.next.prev = @
        bead.next = @

    insert_before: (bead) =>
        @prev = bead.prev
        @next = bead
        bead.prev.next = @
        bead.prev = @

        if bead.first
            @first = true
            bead.first = false

    remove: =>
        if @first
            @next.first = true
            @first = false

        @prev.next = @next
        @next.prev = @prev
        @prev = @
        @next = @

    find_index: (index) =>
        b = @
        while b.index != index do b = b.next
        return b

    find_value: (value) =>
        b = @
        while b.value != value do b = b.next
        return b

    find_first: =>
        b = @
        while not b.first do b = b.next
        return b

    chain: =>
        b = nil
        return while b != @
            if b == nil
                b = @
            c = b
            b = b.next
            c

    move: (cnt, size) =>
        c = if cnt > 0 then cnt % (size-1) else -((-cnt) % (size-1))

        if c > 0
            n = @next
            @\remove!
            for i = 2, c
                n = n.next
            @\insert_after n

        if c < 0
            p = @prev
            @\remove!
            for i = 2, -c
                p = p.prev
            @\insert_before p

    navigate: (cnt) =>
        if cnt > 0
            n = @next
            for i = 2, cnt
                n = n.next
            return n

        if cnt < 0
            p = @prev
            for i = 2, -cnt
                p = p.prev
            return p

        return @

    move_self: (size) =>
        @\move @value, size

load_beads = (filename) ->
    file = io.open filename, "r"
    content = file\read "*all"

    numbers = [tonumber token for token in string.gmatch(content, "[-%d]+")]


    beads = [Bead n, i for i, n in ipairs numbers]

    do
        local bb
        for b in *beads
            if bb != nil
                b\insert_after bb
            bb = b
    return beads

print_beads = (beads) ->
    f = beads[1]\find_first!
    p [ p.value for p in *f\chain!]
        --{v: p.value, i:p.index}

mix = (beads) ->
    -- print_beads beads
    size = #beads
    for i = 1, size
        b = beads[1]\find_index(i)
        -- print "#{i}: Moving #{b.value}"
        b\move_self size
        -- print_beads beads

sum = (beads) ->
    z = beads[1]\find_value 0
    b1 = z\navigate 1000
    b2 = z\navigate 2000
    b3 = z\navigate 3000

    b1.value + b2.value + b3.value

task1 = (filename) ->
    beads = load_beads filename
    mix beads
    print sum(beads)

task2 = (filename) ->
    beads = load_beads filename
    for b in *beads do b.value *= 811589153
    for i = 1, 10 do mix beads
    print sum(beads)

main = ->
    task1 arg[1]
    task2 arg[1]

main!
