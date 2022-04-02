defmodule Problem4 do

  def mult_bound(n), do: { min_n_digits(n), max_n_digits(n) }

  def seek_bound(n) do
    low  = min_n_digits(n) * min_n_digits(n)
    high = max_n_digits(n) * max_n_digits(n)
    { low, high }
  end

  def max_palin(n) do
    {low, high} = seek_bound(n)
    palin = next_palin({low, high}, high)
    find_palin({low, high}, n, palin)
  end

  def find_palin(_range, _n, nil), do: "No more found"
  def find_palin(range = {low, high}, n, palin) when low <= palin and palin <= high do
    case check_up(palin, n) do
      true  -> palin
      false -> find_palin(range, n, next_palin(range, palin - 1))
    end
  end

  def check_up(palin, n) do
    high = trunc(:math.sqrt(palin))
    {low, _} = mult_bound(n)
    case divisor({low, high}, palin, high, n) do
      nil -> false
      _   -> true
    end
  end

  def divisor({low, _high}, _palin, mult, _n) when mult < low, do: nil
  def divisor({low, high}, palin, mult, n) when low <= mult and mult <= high do
    case is_divisor(palin, mult) and is_in_mult_bound(palin, mult, n) do
      true -> mult
      false -> divisor({low, high}, palin, mult - 1, n)
    end
  end

  def is_divisor(palin, mult) when rem(palin, mult) == 0, do: true
  def is_divisor(_palin, _mult), do: false

  def is_in_mult_bound(palin, mult_1, n) do
    mult_2 = div(palin, mult_1)
    {low, high} = mult_bound(n)
    if low <= mult_2 and mult_2 <= high do
      true
    else
      false
    end
  end
  
  def next_palin({ low, _high }, p) when p < low, do: nil
  def next_palin({ low, high }, p) when low <= p and p <= high do
    case is_palin(p) do
      true  -> p
      false -> next_palin({ low, high }, p - 1)
    end
  end

  def max_n_digits(1), do: 9
  def max_n_digits(n) when n > 1 do
    max_n_digits(1) * :math.pow(10, n - 1) + max_n_digits(n-1) |> trunc
  end

  def min_n_digits(1), do: 1
  def min_n_digits(n) when n > 1, do: :math.pow(10, n - 1) |> trunc

  def is_palin(number), do: to_charlist(number) == (to_charlist(number) |> Enum.reverse)

end

IO.puts Problem4.max_palin(3)
