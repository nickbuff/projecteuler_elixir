defmodule Problem1_1 do

  def sum(max) do
  	range = (1..max-1)
  	transform(range) |> Enum.sum()
  end

  def transform(range), do: Enum.map(range, &(transform_one(&1)))

  def transform_one(n), do: _transform_one(n)

  defp _transform_one(n) do
    case {rem(n,3), rem(n,5), n} do
      {0,0,n} -> n
      {0,_,n} -> n
      {_,0,n} -> n
      {_,_,_} -> 0
    end
  end

end

IO.puts Problem1_1.sum(1000)
