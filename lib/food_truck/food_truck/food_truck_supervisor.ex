defmodule FoodTruck.FoodTruckSupervisor do
  use Supervisor
  require Logger

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(:ok) do
    children = [
      FoodTruck.FoodTruckServer
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
