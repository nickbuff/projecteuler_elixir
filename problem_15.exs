defmodule Problem15 do
  def number_of_routes(n, m) do
    div (div of(m + n), of(m)), of(n)
  end

  def of(0), do: 1
  def of(n) when n > 0, do: n * of(n - 1)
end

IO.puts Problem15.number_of_routes(20, 20)