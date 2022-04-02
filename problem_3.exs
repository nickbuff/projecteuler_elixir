defmodule Problem3 do  
  def max_prime(n), do: match_primes(n) |> Enum.max

  def match_primes(n, d \\ 2)
  def match_primes(n, d) when n >= 2 do
    if d < n do
      case rem(n, d) == 0 and is_prime(d) do
        true  -> [ d | match_primes(div(n, d), d) ]
        false -> match_primes(n, d + 1)
      end
    else
      [d]
    end
  end

  def is_prime(n) when n in [1,2,3], do: true
  def is_prime(n) do
    limit = trunc(:math.sqrt(n))
    (2..limit |> Enum.filter( fn d -> rem(n, d) == 0 and is_prime(d) end)) == []
  end

end

IO.puts Problem3.max_prime(600851475143)
