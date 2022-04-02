defmodule Problem19 do
  def sundays_in_the_range do
    from = ~D[1901-01-01]
    to = ~D[2000-12-31]

    count_sundays(from, to)
  end

  def count_sundays(_d, _to, acc \\ 0)

  def count_sundays(d, to, acc) do
    case Date.compare(d, to) == :gt do
      true ->
        acc

      false ->
        if is_sunday?(d) do
          count_sundays(next_month(d), to, acc + 1)
        else
          count_sundays(next_month(d), to, acc)
        end
    end
  end

  def is_sunday?(date), do: Date.day_of_week(date) == 6

  def next_month(%Date{day: day} = date) do
    days_this_month = Date.days_in_month(date)
    first_of_next = Date.add(date, days_this_month - day + 1)
    days_next_month = Date.days_in_month(first_of_next)

    Date.add(first_of_next, min(day, days_next_month) - 1)
  end
end

IO.puts(Problem19.sundays_in_the_range())
