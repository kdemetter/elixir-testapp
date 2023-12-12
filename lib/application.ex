
defmodule MyApp.Application do
  use Application

  def start(type, args) do
    children = [
      # {Menumaker, []}
    ]

    Menumaker.start(type, args)

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
