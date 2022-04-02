defmodule Problem10_1 do
  def sum_primes_below(n) do
    Enum.to_list(2..n) |> filter_primes() |> Enum.sum
  end

  def filter_primes([]), do: []
  def filter_primes([ p | tail ]) do
    IO.puts p
    [ p | Enum.reject(tail, fn n -> rem(n,p) == 0 end) |> filter_primes ]
  end
end

IO.puts Problem10_1.sum_primes_below(2000000)

