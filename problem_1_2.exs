defmodule Problem1_2 do
  def sum(max) do
    list = Enum.to_list(1..(max - 1))
    calculate_sum(list)
  end

  def calculate_sum([]), do: 0
  def calculate_sum([head | tail]), do: transform_one(head) + calculate_sum(tail)

  def transform_one(n), do: _transform_one(n)

  defp _transform_one(n) do
    case {rem(n, 3), rem(n, 5), n} do
      {0, 0, n} -> n
      {0, _, n} -> n
      {_, 0, n} -> n
      {_, _, _} -> 0
    end
  end
end

IO.puts(Problem1_2.sum(1000))
