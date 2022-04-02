defmodule Problem12 do
  require Problem3
  require Problem5

  def triangular_with_l_divisors(l, n \\ 1)
  def triangular_with_l_divisors(l, n) do
    tn = triangular_number(n)
    case number_of_divisors(tn) > l do
      true  -> tn
      false -> triangular_with_l_divisors(l, n + 1)
    end
  end

  def triangular_number(m), do: (1..m) |> Enum.sum

  def number_of_divisors(n) do
    Problem3.match_primes(n) 
    |> Problem5.primes_to_map 
    |> Enum.reduce(1, fn({_, v}, p) -> p * (v + 1) end)
  end

end

IO.puts Problem12.triangular_with_l_divisors(500)