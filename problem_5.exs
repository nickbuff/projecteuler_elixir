defmodule Problem5 do
  require Problem3

  def lcm(max) do
    primes = ( primes_list(max) |> find_max_primes )
    Enum.reduce(primes, 1, fn { k, v }, p -> 
      p * ( :math.pow(k, v) |> trunc )
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

  def add_max_key_value(r, k, v), do: %{r | k => v}

  def primes_list(max), do: Enum.map((2..max), fn n -> Problem3.match_primes(n) 
                                                       |> primes_to_map end)

  def primes_to_map(_, map \\ %{})
  def primes_to_map([], map), do: map 
  def primes_to_map([ head | tail ], map) do
    nmap = case Map.has_key? map, head do
      true -> increase_count(map, head)
      false -> initialize_count(map, head)
    end
    primes_to_map(tail, nmap)
  end

  def increase_count(map, key) do
    count = map[key]
    %{map | key => count + 1}
  end

  def initialize_count(map, key), do: Map.put(map, key, 1)
end

IO.puts Problem5.lcm(20)
