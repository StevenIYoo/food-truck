defmodule FoodTruck.FoodTruckSupervisor do
  use DynamicSupervisor
  require Logger

  alias FoodTruck.FoodTruckServer

  def start_link(init_arg) do
    DynamicSupervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  @spec start_food_truck_system() :: :ok | DynamicSupervisor.on_start_child()
  def start_food_truck_system() do
    server =
      FoodTruckServer.server_name()
      |> GenServer.whereis()

    if server == nil do
      Logger.debug("food truck system started")
      DynamicSupervisor.start_child(
        __MODULE__,
        {FoodTruckServer, {}}
      )
    end
  end
end
