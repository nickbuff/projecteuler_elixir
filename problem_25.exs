defmodule Problem25 do
  def fib(_m, p \\ 1, pp \\ 1, i \\ 3)

  def fib(m, p, pp, i) do
    case Integer.digits(p + pp) |> length == m do
      true -> IO.puts(i)
      false -> fib(m, pp + p, p, i + 1)
    end
  end
end

IO.puts(Problem25.fib(1000))
