defmodule FoodTruck.FoodTruckServer do
  use GenServer
  require Logger

  alias FoodTruck.FileReader
  alias FoodTruck.ParseContent
  alias FoodTruck.FoodTruck

  @type state :: %{
    food_trucks: list(%FoodTruck{})
  }

  @spec server_name() :: GenServer.name()
  def server_name() do
    {:global, "#{__MODULE__}"}
  end

  @spec start_link({}) :: :ignore | {:error, any} | {:ok, pid}
  def start_link({}) do
    GenServer.start_link(__MODULE__, {}, name: server_name())
  end

  @impl true
  def init(_args) do
    food_trucks =
    FileReader.read_file()
    |> ParseContent.parse_content()
    |> ParseContent.get_food_trucks()
    |> Enum.map(&(FoodTruck.new_food_truck(&1)))

    state = %{
      food_trucks: food_trucks
    }

    Logger.debug("Food truck has been started")

    {:ok, state}
  end

  @impl true
  def handle_call(:get_random_food_truck, _from, state) do
    {:reply, Enum.fetch!(state.food_trucks, get_random_number(state))}
  end

  defp get_random_number(state), do: Enum.random(0..Enum.count(state.food_trucks))
end
