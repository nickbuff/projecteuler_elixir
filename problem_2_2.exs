defmodule Problem2_2 do
  require Integer

  def sum(max) do
    f = fibonacci_list(max)
    sum_even_only(f)
  end

  def sum_even_only(list) do
    Enum.reduce list, 0, fn (f, acc) ->
      case Integer.is_even(f) do
        true  -> acc + f
        false -> acc
      end
    end
  end

  def fibonacci_list(max, n \\ 1) do
    case check_below_max(fibonacci(n + 1), max) do
      true  -> [ fibonacci(n) | fibonacci_list(max, n + 1) ]
      false -> [ fibonacci(n) ]
    end
  end

  def check_below_max(current, max) do
    cond do
      current <= max -> true
      current >  max -> false
    end
  end

  def fibonacci(1), do: 1
  def fibonacci(2), do: 2
  def fibonacci(n), do: fibonacci(n - 1) + fibonacci(n - 2)
end
