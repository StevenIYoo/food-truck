defmodule FoodTruck.FoodTruckAPI do
  def get_random_food_truck() do
    name = FoodTruck.FoodTruckServer.server_name()

    GenServer.call(name, {:get_random_food_truck, {}})
  end
end
