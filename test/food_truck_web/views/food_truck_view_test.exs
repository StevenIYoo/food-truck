defmodule FoodTruckWeb.FoodTruckViewTest do
  use FoodTruckWeb.ConnCase, async: true

  describe "food truck render json reder" do
    test "renders food truct", %{conn: conn} do
      conn = get(conn, Routes.food_truck_path(conn, :random_food_truck))

      %{
        "locationId" => _,
        "applicant" =>  _,
        "facilityType" =>  _,
        "cnn" =>  _,
        "locationDescription" => _,
        "address" => _,
        "blockLot" => _,
        "block" => _,
        "lot" => _,
        "permit" => _,
        "status" => _,
        "foodItems" => _,
        "x" => _,
        "y" => _,
        "latitude" => _,
        "longitude" => _,
        "schedule" => _,
        "daysHours" => _,
        "noiSent" => _,
        "approved" => _,
        "received" => _,
        "priorPermit" => _,
        "expirationDate" =>  _,
        "location" => _,
        "firePreventionDistricts" => _,
        "policeDistricts" =>  _,
        "supervisorDistricts" =>  _,
        "zipCodes" =>  _,
        "neighborhoodsOld" => _
      } =
      assert json_response(conn, 200)["data"]
    end
  end
end
