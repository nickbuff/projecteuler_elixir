defmodule Problem20 do
  def sum_digits(m), do: of(m) |> Integer.digits |> Enum.sum

  def of(0), do: 1
  def of(n) when n > 0, do: n * of(n - 1)
end

IO.puts Problem20.sum_digits(100)
