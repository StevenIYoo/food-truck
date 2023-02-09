defmodule FoodTruckWeb.FoodTruckController do
  use FoodTruckWeb, :controller

  alias FoodTruck.FoodTruckAPI

  @moduledoc """
    Controller for the food truck API
  """

  @doc "returns a random food truck from the data source as json"
  def random_food_truck(conn, _params) do
    food_truck = FoodTruckAPI.get_random_food_truck()

    render(conn, "food_truck.json", food_truck: food_truck)
  end
end
