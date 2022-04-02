defmodule Problem6 do
  def square_diff(n) do
    list = Enum.to_list(1..n)
    sum_of_squares = Enum.reduce(list, 0, fn p, sq -> sq + p * p end)
    sum = Enum.sum(list)
    sum * sum - sum_of_squares
  end
end

IO.puts Problem6.square_diff(100)
