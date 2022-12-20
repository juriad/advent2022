fun readLines fname = let
    fun readLines2 f = case (TextIO.inputLine f) of
                NONE => []
                | SOME line => line :: (readLines2 f)
    val f = TextIO.openIn fname
in
    readLines2 f
end

val fname = List.nth(CommandLine.arguments(), 0)
val input : string list = readLines fname

fun parsePoint line = let
    val split = String.fields Char.isPunct line
in
    map (fn s => Option.valOf (Int.fromString s)) split
end

val points = map parsePoint input
val maxes = foldl (fn ([a, b, c], [x, y, z]) => [if a > x then a else x, if b > y then b else y, if c > z then c else z]) [0, 0, 0] points
(* val _ = map (fn m => print ((Int.toString m) ^ "\n")) maxes *)

fun idx [x, y, z] = let
    val [mx, my, mz] = maxes
in
    (x + 1) * (my + 3) * (mz + 3) + (y + 1) * (mz + 3) + (z + 1)
end

val arr = case maxes of [mx, my, mz] => Array.array((mx + 3) * (my + 3) * (mz + 3), 0)
val _ = map (fn p => Array.update(arr, idx p, 1)) points

fun around [x, y, z] =
    [[x, y, z-1], [x, y, z+1], [x, y-1, z], [x, y+1, z], [x-1, y, z], [x+1, y, z]]

fun outOfRange [x, y, z] = let
    val [mx, my, mz] = maxes
in
    (x < ~1) orelse (y < ~1) orelse (z < ~1)
        orelse (x > mx + 1) orelse (y > my + 1) orelse (z > mz + 1)
end

fun isEmpty p =
    (outOfRange p) orelse Array.sub(arr, idx p) = 0


fun countFaces [x, y, z] = foldl (Int.+) 0 (map (fn p => if (isEmpty p) then 1 else 0) (around [x, y, z]))
val faces = foldl (Int.+) 0 (map countFaces points)
val _ = print ((Int.toString faces) ^ "\n")

fun flood p = let
    (* val _ = print ((foldl String.^ "[" (map (fn x => (Int.toString x) ^ ", ") p)) ^ "\n") *)
    val state = Array.sub(arr, idx p)
in
    if state = 0 then doFlood p else ()
end
and doFlood p = let
    val _ = Array.update(arr, idx p, 2)
    val cand = List.filter (fn n => not (outOfRange n)) (around p)
    val _ = map flood cand
in
    ()
end

val _ = flood [0, 0, 0]
val faces2 = foldl (Int.+) 0 (map countFaces points)
val _ = print ((Int.toString (faces - faces2)) ^ "\n")
