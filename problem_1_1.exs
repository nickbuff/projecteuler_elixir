defmodule Problem1_1 do

  def sum(max) do
  	range = (1..max-1)
  	transform(range) |> Enum.sum()
  end

  def transform(range), do: Enum.map(range, &(transform_one(&1)))

  def match do
    fn
      (0,0,m) -> m
      (0,_,m) -> m
      (_,0,m) -> m
      (_,_,_) -> 0
    end
  end

  def transform_one(n), do: match().(rem(n,3), rem(n,5), n)

end

IO.puts Problem1_1.sum(1000)
