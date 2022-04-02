defmodule Problem10_2 do
  def sum_primes_below(limit) do
    primes(limit, 2) |> Enum.sum()
  end

  def primes(limit, p) when p >= limit, do: []

  def primes(limit, p) do
    IO.puts(p)

    case is_prime(p) do
      true -> [p | primes(limit, p + 1)]
      false -> primes(limit, p + 1)
    end
  end

  def is_prime(n) when n in [1, 2, 3], do: true

  def is_prime(n) do
    limit = trunc(:math.sqrt(n))

    case 2..limit |> Enum.filter(fn d -> rem(n, d) == 0 and is_prime(d) end) do
      [] -> true
      _ -> false
    end
  end
end

IO.puts(Problem10_2.sum_primes_below(2_000_000))
