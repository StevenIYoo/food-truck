defmodule FoodTruck.FoodTruckServer do
  use GenServer
  require Logger

  alias FoodTruck.FileReader
  alias FoodTruck.ParseContent
  alias FoodTruck.FoodTruckStruct

  @type state :: %{
    food_trucks: list(FoodTruckStruct.t)
  }

  @spec server_name() :: GenServer.name()
  def server_name() do
    {:global, "#{__MODULE__}"}
  end

  @spec start_link([]) :: :ignore | {:error, any} | {:ok, pid}
  def start_link(opts) do
    Logger.debug("starting food truck")
    GenServer.start_link(__MODULE__, opts, name: server_name())
  end

  @impl true
  def init(_args) do
    food_trucks = FileReader.read_file()
    |> ParseContent.parse_content()

    state = %{
      food_trucks: food_trucks
    }

    Logger.debug("Food truck has been started")

    {:ok, state}
  end

  @impl true
  def handle_call(:get_random_food_truck, _from, state) do
    {:reply, {:ok, get_random_food_truck(state.food_trucks)}, state}
  end

  defp get_random_food_truck([]), do: %FoodTruckStruct{}
  defp get_random_food_truck(food_trucks) do
    random_number = Enum.random(0..Enum.count(food_trucks) - 1)
    Enum.fetch!(food_trucks, random_number)
  end
end
