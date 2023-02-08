defmodule FoodTruckTest do
  use ExUnit.Case, async: true

  alias FoodTruck.FileReader
  alias FoodTruck.ParseContent
  alias FoodTruck.FoodTruck

  @test_file_local_path "/test/Mobile_Food_Facility_Permit_Test.csv"

  describe "food truck struct" do
    setup do
      parsed_food_trucks = FileReader.read_file(@test_file_local_path)
      |> ParseContent.parse_content()
      |> ParseContent.get_food_trucks()

      {:ok, food_trucks: parsed_food_trucks}
    end

    test "check struct is formed", %{food_trucks: food_trucks} do
      food_truck = FoodTruck.new_food_truck(List.first(food_trucks))

      assert food_truck ==
      %FoodTruck{
        location_id: "735318",
        applicant: "Ziaurehman Amini",
        facility_type: "Push Cart",
        cnn: "30727000",
        location_description: "MARKET ST: DRUMM ST intersection",
        address: "5 THE EMBARCADERO",
        block_lot: "0234017",
        block: "0234",
        lot: "017",
        permit: "15MFF-0159",
        status: "REQUESTED",
        food_items: "",
        x: "6013916.72",
        y: "2117244.027",
        latitude: "37.794331003246846",
        longitude: "-122.39581105302317",
        schedule: "http://bsm.sfdpw.org/PermitsTracker/reports/report.aspx?title=schedule&report=rptSchedule&params=permit=15MFF-0159&ExportPDF=1&Filename=15MFF-0159_schedule.pdf",
        days_hours: "",
        noi_sent: "",
        approved: "",
        received: "20151231",
        prior_permit: "0",
        expiration_date: "03/15/2016 12:00:00 AM",
        location: "(37.794331003246846, -122.39581105302317)",
        fire_prevention_districts: "4",
        police_districts: "1",
        supervisor_districts: "10",
        zip_codes: "28855",
        neighborhoods_old: "6"
      }
    end
  end
end
