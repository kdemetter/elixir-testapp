defmodule Menumaker do

  def generate_week_menu(menus, nr_per_week \\ 7)

  def generate_week_menu(menus, nr_per_week) when length(menus) >= nr_per_week do
    Enum.take_random(menus,nr_per_week) |> Enum.with_index
  end

  def generate_week_menu(menus, nr_per_week) do
    raise "Menu must have at least #{nr_per_week} items"
  end

  def main do
    menus = ["a", "b", "c" ,"d", "e", "f", "g", "k","l","m", "n"]

    Enum.each(1..10, fn(_x) ->
      week_menu = generate_week_menu(menus)
      Enum.each(week_menu, fn({entry, index}) ->
        IO.puts("#{index}.#{entry}")
      end)
      IO.puts("---")

    end)


  end

end


Menumaker.main()
