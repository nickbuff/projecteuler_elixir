defmodule Problem5 do
  require Problem3

  def lcm(max) do
    primes = ( primes_list(max) |> find_max_primes )
    Enum.reduce(primes, 1, fn { k, v }, p -> 
      k_int = k |> Atom.to_string |> String.to_integer
      p * ( :math.pow(k_int, v) |> trunc )
    end)
  end

  def find_max_primes(_, result \\ %{})
  def find_max_primes([], _), do: []
  def find_max_primes(primes, result) do
    Enum.reduce(primes, result, fn p, r -> add_keys(p, r) end)
  end

  def add_keys(p, r) do
    Enum.reduce p, r, fn { k, v }, rr -> 
      case {(Map.has_key? rr, k), rr[k] < v } do
        {true, true} -> add_max_key_value(rr, k, v)
        {true, false} -> rr
        {false, _} -> Map.put(rr, k, v)
      end
    end 
  end

  def add_max_key_value(r, k, v) do
    %{r | k => v}
  end

  def primes_list(max) do
    Enum.map((1..max), fn n -> Problem3.match_primes(n) end) |> primes_to_maps
  end

  def primes_to_maps([]), do: []
  def primes_to_maps([ head | tail ]) do
    [ transform_single_primes(head) | primes_to_maps(tail) ]
  end

  def transform_single_primes(_, map \\ %{})
  def transform_single_primes([], map), do: map 
  def transform_single_primes([ head | tail ], map) do
    key = head |> Integer.to_string |> String.to_atom
    nmap = case Map.has_key? map, key do
      true -> increase_count(map, key)
      false -> initialize_count(map, key)
    end
    transform_single_primes(tail, nmap)
  end

  def increase_count(map, key) do
    count = map[key]
    %{map | key => count + 1}
  end

  def initialize_count(map, key) do
    Map.put(map, key, 1)
  end
end

IO.puts Problem5.lcm(20)