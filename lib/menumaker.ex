defmodule Menumaker do

  @default_weekdays [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]

  def get_day_by_nr(day_of_week, weekdays \\ @default_weekdays)

  def get_day_by_nr(day_of_week, weekdays) when day_of_week >= 0 and day_of_week <= length(weekdays) do
      Enum.at(weekdays, day_of_week)
  end

  def generate_week_menu(menus, nr_per_week \\ 7, weekdays \\ @default_weekdays)

  def generate_week_menu(menus, nr_per_week, weekdays) when length(menus) >= nr_per_week do
    Enum.take_random(menus,nr_per_week) |> Enum.with_index |> Enum.map(fn({entry, index}) ->
      {get_day_by_nr(index, weekdays), entry}
    end)
  end

  def generate_week_menu(_menus, nr_per_week,_weekdays) do
    raise ArgumentError, message: "menus must have at least #{nr_per_week} items"
  end

end
