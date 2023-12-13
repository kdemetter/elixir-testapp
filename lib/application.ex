
defmodule MyApp.Application do
  use Application

  def start(_type, _args) do
    children = [
      # {Menumaker, []}
    ]

    menus = ["a", "b", "c" ,"d", "e", "f", "g", "k","l","m", "n"]

    Enum.each(1..10, fn(_x) ->
      week_menu = Menumaker.generate_week_menu(menus)
      Enum.each(week_menu, fn({day, entry}) ->
        IO.puts("#{day}.#{entry}")
      end)
      IO.puts("---")
    end)

    # opts = [strategy: :one_for_one, name: MyApp.Supervisor]
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end

# defmodule MyApp.Supervisor do
#   use Supervisor

#   def start_link(_args) do
#     Supervisor.start_link(__MODULE__, :ok)
#   end

#   def init(:ok) do
#     children = [
#       MyApp.Application
#     ]

#     supervise(children, strategy: :one_for_one)
#   end
# end
