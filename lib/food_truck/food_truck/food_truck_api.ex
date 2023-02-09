defmodule FoodTruck.FoodTruckAPI do
  alias FoodTruck.FoodTruckStruct

  @get_random_food_truck_action :get_random_food_truck

  @spec get_random_food_truck() :: FoodTruckStruct.t
  def get_random_food_truck() do
    case call_food_truck_server(@get_random_food_truck_action) do
      {:ok, random_food_truck} -> random_food_truck
      _ ->
        {:error, "Error calling service #{FoodTruck.FoodTruckServer.server_name()}"}
    end
  end

  defp call_food_truck_server(action) do
    name = FoodTruck.FoodTruckServer.server_name()

    GenServer.call(name, action)
  end
end
