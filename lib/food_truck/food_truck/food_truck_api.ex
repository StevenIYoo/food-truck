defmodule FoodTruck.FoodTruckAPI do
  alias FoodTruck.FoodTruckStruct
  alias FoodTruck.FoodTruckServer

  @moduledoc """
    API to use functionality in `FoodTruck.FoodTruckServer`
  """

  @get_random_food_truck_action :get_random_food_truck

  @doc """
    returns a random `FoodTruckStruct.t` cached on `FoodTruckServer`
    will return a generic service error when failing to call `FoodTruckServer`
  """
  @spec get_random_food_truck() :: FoodTruckStruct.t
  def get_random_food_truck() do
    case call_food_truck_server(@get_random_food_truck_action) do
      {:ok, random_food_truck} -> random_food_truck
      _ ->
        {:error, "Error calling service #{FoodTruckServer.server_name()}"}
    end
  end

  defp call_food_truck_server(action) do
    name = FoodTruckServer.server_name()

    GenServer.call(name, action)
  end
end
