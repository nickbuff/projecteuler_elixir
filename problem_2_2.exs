defmodule Problem2_2 do
  require Integer

  def sum(max) do
    f = fibonacci_list(max)
    sum_even_only(f)
  end

  def sum_even_only(list) do
    Enum.reduce(list, 0, fn f, acc ->
      case Integer.is_even(f) do
        true -> acc + f
        false -> acc
      end
    end)
  end

  def fibonacci_list(max, n \\ 1) do
    cond do
      fibonacci(n + 1) <= max -> [fibonacci(n) | fibonacci_list(max, n + 1)]
      fibonacci(n + 1) > max -> [fibonacci(n)]
    end
  end

  def fibonacci(1), do: 1
  def fibonacci(2), do: 2
  def fibonacci(n), do: fibonacci(n - 1) + fibonacci(n - 2)
end

IO.puts(Problem2_2.sum(4_000_000))
