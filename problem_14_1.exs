defmodule Problem14_1 do
  require Integer

  def max_length(max_number) do
    (1..max_number) 
    |> Enum.max_by(&sequence_length/1)
  end

  def sequence_length(start) when is_integer(start), do: generate_from_start(start) |> length

  def generate_from_start(start) when is_integer(start), do: generate_sequence([start])

  def generate_sequence(s = [1 | _t]), do: s
  def generate_sequence(s = [h | _t]) do
    generate_sequence( [ collatz_sequence(h) | s ] )
  end

  def collatz_sequence(1), do: 1
  def collatz_sequence(n) when is_integer(n) and Integer.is_even(n), do: div(n, 2)  
  def collatz_sequence(n) when is_integer(n) and Integer.is_odd(n), do: 3*n + 1

end

IO.inspect Problem14.max_length(1_000_000)