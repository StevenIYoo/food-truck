defmodule FoodTruck.FoodTruck.FoodTruckServer do
  use GenServer
  require Logger

  alias FoodTruck.FileReader
  alias FoodTruck.ParseContent
  alias FoodTruck.FoodTruck

  @spec server_name() :: GenServer.name()
  def server_name() do
    {:global, "#{__MODULE__}"}
  end

  @impl true
  def init(_args) do
    food_trucks =
    FileReader.read_file()
    |> ParseContent.parse_content()
    |> ParseContent.get_food_trucks()
    |> Enum.map(&(FoodTruck.new_food_truck(&1)))
    |> IO.inspect(pretty: true, label: "food trucks")

    state = %{
      food_trucks: food_trucks
    }

    Logger.debug("Food truck has been started")

    {:ok, state}
  end

  @impl true
  def handle_call(:get_random_food_truck, _from, state) do
    random_number = Enum.random(0..Enum.count(state.food_trucks))
    {:reply, Enum.fetch!(state.food_trucks, random_number)}
  end
end
