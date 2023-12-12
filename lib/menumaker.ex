defmodule Menumaker do

  @default_weekdays [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]

  def get_day_by_nr(day_of_week, weekdays \\ @default_weekdays)

  def get_day_by_nr(day_of_week, weekdays) when day_of_week >= 0 and day_of_week <= length(weekdays) do
      Enum.at(weekdays, day_of_week)
  end

  def generate_week_menu(menus, nr_per_week \\ 7)

  def generate_week_menu(menus, nr_per_week) when length(menus) >= nr_per_week do
    Enum.take_random(menus,nr_per_week) |> Enum.with_index
  end

  def generate_week_menu(_menus, nr_per_week) do
    raise ArgumentError, message: "menus must have at least #{nr_per_week} items"
  end

  def start(_type, _args) do
    menus = ["a", "b", "c" ,"d", "e", "f", "g", "k","l","m", "n"]

    Enum.each(1..10, fn(_x) ->
      week_menu = generate_week_menu(menus)
      Enum.each(week_menu, fn({entry, index}) ->
        name_index = get_day_by_nr(index)
        IO.puts("#{name_index}.#{entry}")
      end)
      IO.puts("---")
    end)

  end

end
