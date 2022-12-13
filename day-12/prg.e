include std/io.e
include std/math.e

enum ROW, COL

sequence cmd = command_line()
object file = cmd[3]

global sequence map = read_lines(file)
-- ? map

global integer height = length(map)
global integer width = length(map[1])

global sequence queue = {}
global integer head = 1
global integer tail = 1

procedure newque()
    queue = repeat(0, width * height)
end procedure

procedure enqueue(object v)
    queue[tail] = v
    tail = mod(tail, length(queue)) + 1
end procedure

function dequeue()
    object h = queue[head]
    head = mod(head, length(queue)) + 1
    return h
end function

function lenque()
    if head <= tail then
        return tail - head
    else
        return length(queue) + tail - head
    end if
end function

function find(integer char)
    for r = 1 to height do
        for c = 1 to width do
            if map[r][c] = char then
                return {r, c}
            end if
        end for
    end for
end function

function inside(integer r, integer c)
    return r >= 1 and c >= 1 and r <= height and c <= width
end function

sequence s = find('S')
map[s[ROW]][s[COL]] = 'a'

sequence e = find('E')
map[e[ROW]][e[COL]] = 'z'

function walk(sequence s, integer up)
    sequence dist = repeat(0, height)
    for r = 1 to height do
        dist[r] = repeat(999999, width)
    end for
    dist[s[ROW]][s[COL]] = 0

    newque()
    enqueue(s)

    while lenque() > 0 do
        sequence p = dequeue()
        integer pr = p[ROW]
        integer pc = p[COL]
        integer pv = map[pr][pc]
        integer pd = dist[pr][pc]

        sequence around = {{pr-1, pc}, {pr+1, pc}, {pr, pc-1}, {pr, pc+1}}
        for a = 1 to length(around) do
            integer ar = around[a][ROW]
            integer ac = around[a][COL]

            if inside(ar, ac) then
                integer av = map[ar][ac]
                integer ad = dist[ar][ac]

                if ad > pd + 1 then
                    if (up and av <= pv + 1) or (not up and av >= pv -1) then
                        dist[ar][ac] = pd + 1
                        enqueue({ar,ac})
                    end if
                end if
            end if
        end for
    end while

    return dist
end function

sequence dist = walk(s, 1)

? dist[e[ROW]][e[COL]]

sequence dist2 = walk(e, 0)

integer m = 999999
for r = 1 to height do
    for c = 1 to width do
        if map[r][c] = 'a' and dist2[r][c] < m then
            m = dist2[r][c]
        end if
    end for
end for

? m
