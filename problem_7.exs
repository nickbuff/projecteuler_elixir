defmodule Problem7 do
  def nth_prime(n) do
    n_primes = primes(n, 0, 2) 
    Enum.at(n_primes, -1)
  end

  def primes(n, n, _), do: []
  def primes(n, acc, p) do
    case is_prime(p) do
      true -> [ p | primes(n, acc + 1, p + 1)]
      false -> primes(n, acc, p + 1)
    end
  end

  def is_prime(n) when n in [1,2,3], do: true
  def is_prime(n) do
    limit = trunc(:math.sqrt(n))
    case 2..limit |> Enum.filter( fn d -> rem(n, d) == 0 and is_prime(d) end) do
      [] -> true
       _ -> false
    end
  end
end

IO.puts Problem7.nth_prime(10001)
