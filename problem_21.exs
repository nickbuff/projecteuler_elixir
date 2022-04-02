defmodule Problem21 do
  require Problem3
  require Problem5

  def sum_amicable_under_m(m) do
    2..m
    |> Enum.map(fn n ->
      if amicable_numbers?(n, sum_of_divisors(n)) == true,
        do: n,
        else: 0
    end)
    |> Enum.sum()
  end

  def amicable_numbers?(a, b), do: sum_of_divisors(a) == b and sum_of_divisors(b) == a and a != b

  def sum_of_divisors(1), do: 1

  def sum_of_divisors(n) do
    sum_of_all_divisors =
      Problem3.match_primes(n)
      |> Problem5.primes_to_map()
      |> Enum.reduce(1, fn {k, v}, p -> (p * (:math.pow(k, v + 1) - 1) / (k - 1)) |> round end)

    sum_of_all_divisors - n
  end
end

IO.inspect(Problem21.sum_amicable_under_m(10_000))
