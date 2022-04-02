defmodule Problem9 do
  def inner_loop(s, _a, b \\ 2)
  def inner_loop(s, _a, b) when b == div(s, 2), do: nil
  def inner_loop(s, a, b) when b < div(s, 2) do
    case s - a - b == :math.sqrt(a*a + b*b) do
      true -> [ a, b, s - a - b ]
      false -> inner_loop(s, a, b + 1)
    end
  end

  def triplet(s, a \\ 1, b \\ 2)
  def triplet(s, a, b) when a == div(s, 3) and b == div(s, 2), do: nil
  def triplet(s, a, b) when a < div(s, 3) and b < div(s, 2) do
    case inner_loop(s, a, b) do
      h = [ _, _, _ ] -> h
      _ -> triplet(s, a + 1, b + 1)
    end
  end

  def triplet_mult(s), do: triplet(s) |> Enum.reduce(1, fn n, acc -> n * acc end)
end

IO.puts Problem9.triplet_mult(1000)
