[file_name] = System.argv()
{:ok, f} = File.read(file_name)

map = String.split(f, "\n", trim: true)
  |> Enum.map(&String.codepoints/1)
  |> Enum.with_index()
  |> Enum.flat_map(fn {l, row} -> l
    |> Enum.with_index()
    |> Enum.filter(fn {char, _} -> char == "#" end)
    |> Enum.map(fn {_, col} -> {row, col} end)
  end)
  |> Enum.frequencies()

north = fn {row, col}, map ->
  cnt = -1..1
    |> Enum.map(fn d -> Map.get(map, {row - 1, col + d}, 0) end)
    |> Enum.sum()
  {cnt, {row - 1, col}}
end

south = fn {row, col}, map ->
  cnt = -1..1
    |> Enum.map(fn d -> Map.get(map, {row + 1, col + d}, 0) end)
    |> Enum.sum()
  {cnt, {row + 1, col}}
end

west = fn {row, col}, map ->
  cnt = -1..1
    |> Enum.map(fn d -> Map.get(map, {row + d, col - 1}, 0) end)
    |> Enum.sum()
  {cnt, {row, col - 1}}
end

east = fn {row, col}, map ->
  cnt = -1..1
    |> Enum.map(fn d -> Map.get(map, {row + d, col + 1}, 0) end)
    |> Enum.sum()
  {cnt, {row, col + 1}}
end

dirs = [north, south, west, east]

propose = fn pos, map, dirs ->
  ds = dirs |> Enum.map(fn dir -> dir.(pos, map) end)
  if ds |> Enum.map(fn {cnt, _} -> cnt end) |> Enum.sum() == 0 do
    pos
  else
    case ds |> Enum.find(fn {cnt, _} -> cnt == 0 end) do
      {0, towards} -> towards
      _ -> pos
    end
  end
end

show_map = fn map ->
  {row_min, row_max} = map
    |> Enum.map(fn {{row, _}, _} -> row end)
    |> Enum.min_max()
  {col_min, col_max} = map
    |> Enum.map(fn {{_, col}, _} -> col end)
    |> Enum.min_max()

  Enum.map_join(row_min..row_max, "\n", fn r ->
    Enum.map_join(col_min..col_max, "", fn c ->
      if Map.has_key?(map, {r, c}) do "#" else "." end
      end)
    end)
end

move = fn map, dirs ->
  proposed = map
    |> Enum.map(fn {pos, _} -> {pos, propose.(pos, map, dirs)} end)
    |> Enum.group_by(fn {_, to} -> to end, fn {pos, _} -> pos end)
  resolved = proposed
    |> Enum.flat_map(fn {to, from} -> if length(from) == 1 do [to] else from end end)
    |> Enum.frequencies()
  {resolved, Enum.slide(dirs, 0, 3)}
end

moves = fn map, dirs, cnt ->
  1..cnt
    |> Enum.reduce({map, dirs}, fn _, {m, d} -> move.(m, d) end)
end

stable = fn map, dirs ->
  1..1000
    |> Enum.reduce_while({0, map, dirs}, fn _, {i, m, d} ->
      {n, e} = move.(m, d)
      if n == m do
        {:halt, {i + 1, m, d}}
      else
        {:cont, {i + 1, n, e}}
      end
    end)
end

covered = fn map ->
  {row_min, row_max} = map
    |> Enum.map(fn {{row, _}, _} -> row end)
    |> Enum.min_max()
  {col_min, col_max} = map
     |> Enum.map(fn {{_, col}, _} -> col end)
     |> Enum.min_max()

  (row_max - row_min + 1) * (col_max - col_min + 1) - map_size(map)
end

# IO.inspect(map)
# IO.inspect(dirs)
# IO.puts(show_map.(map))

{result, _} = moves.(map, dirs, 10)
# IO.puts(show_map.(result))
IO.puts(covered.(result))

{rounds, _, _} = stable.(map, dirs)
# IO.puts(show_map.(result))
IO.puts(rounds)
