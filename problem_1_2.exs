defmodule Problem1_2 do

  def sum(max) do
  	list = Enum.to_list(1..max-1)
    calculate_sum(list)
  end

  def calculate_sum([]), do: 0
  def calculate_sum([head|tail]), do: transform_one(head) + calculate_sum(tail)

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

IO.puts Problem1_2.sum(1000)
