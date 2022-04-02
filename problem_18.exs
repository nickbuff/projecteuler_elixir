defmodule Problem18 do
  require Problem11

  def max_path(t) do
    triangle = Problem11.string_to_maps(t)
    lines = map_size(triangle)
    _max_path(triangle, lines - 1)
  end

  defp _max_path(_triangle, _i, sum \\ [])
  defp _max_path(_triangle, i, [s | []]) when i == 0, do: IO.inspect(s)
  defp _max_path(triangle, i, []), do: _max_path(triangle, i, _map_sorted_values(triangle[i + 1]))

  defp _max_path(triangle, i, sum) do
    new_sum =
      for j <- 1..i do
        [] ++ (triangle[i][j] + max(Enum.at(sum, j - 1), Enum.at(sum, j)))
      end

    _max_path(triangle, i - 1, new_sum)
  end

  defp _map_sorted_values(m) do
    m
    |> Enum.to_list()
    |> Enum.sort(fn {key1, _}, {key2, _} -> key1 < key2 end)
    |> Enum.map(fn {_, v} -> v end)
  end
end

triangle = "75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"

Problem18.max_path(triangle)
