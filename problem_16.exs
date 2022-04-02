defmodule Problem16 do
  def sum_of_digits(n, p) do
    :math.pow(n, p) 
    |> round 
    |> Integer.digits 
    |> Enum.sum
  end
end

IO.puts Problem16.sum_of_digits(2, 1000)

