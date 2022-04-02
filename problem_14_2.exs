defmodule Problem14_2 do
  require Integer

  def max_length(_max_number, n \\ 1, cache \\ %{})

  def max_length(max_number, n, cache) when n == max_number + 1 do
    max = Map.values(cache) |> Enum.max()

    cache
    |> Enum.find(fn {_k, v} -> v == max end)
    |> elem(0)
  end

  def max_length(max_number, n, cache), do: max_length(max_number, n + 1, generate(n, cache))

  def generate(n, cache) when is_integer(n), do: cache_sequence(n, [n], cache)

  def cache_sequence(n, s = [1 | _t], cache), do: Map.put_new(cache, n, length(s))

  def cache_sequence(n, s = [h | _t], cache) do
    next_collatz = collatz_sequence(h)

    case Map.has_key?(cache, next_collatz) do
      true -> Map.put_new(cache, n, length(s) + cache[next_collatz])
      false -> cache_sequence(n, [collatz_sequence(h) | s], cache)
    end
  end

  def collatz_sequence(1), do: 1
  def collatz_sequence(n) when is_integer(n) and Integer.is_even(n), do: div(n, 2)
  def collatz_sequence(n) when is_integer(n) and Integer.is_odd(n), do: 3 * n + 1
end

IO.inspect(Problem14_2.max_length(1_000_000))
