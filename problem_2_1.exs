defmodule Problem2_1 do
  def sum(max, n \\ 1) do
    current = fibonacci(n)
    cond do
      fibonacci(n + 1) <= max -> filter_even(current) + sum(max, n + 1)
      fibonacci(n + 1) > max  -> filter_even(current)
    end
  end

  def filter_even(current) do
    case rem(current,2) do
      0 -> current
      1 -> 0
    end
  end

  def fibonacci(1), do: 1
  def fibonacci(2), do: 2
  def fibonacci(n), do: fibonacci(n - 1) + fibonacci(n - 2)
end

IO.puts Problem2_1.sum(4_000_000)
