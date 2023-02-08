defmodule FoodTruck.FoodTruck do
  defstruct [
    location_id: nil,
    applicant: "",
    facility_type: "",
    cnn: "",
    location_description: "",
    address: "",
    block_lot: "",
    block: "",
    lot: "",
    permit: "",
    status: "",
    food_items: "",
    x: "",
    y: "",
    latitude: "",
    longitude: "",
    schedule: "",
    days_hours: "",
    noi_sent: "",
    approved: "",
    received: "",
    prior_permit: "",
    expiration_date: "",
    location: "",
    fire_prevention_districts: "",
    police_districts: "",
    supervisor_districts: "",
    zip_codes: "",
    neighborhoods_old: ""
  ]

  @spec new_food_truck(String.t) :: %FoodTruck.FoodTruck{}
  def new_food_truck(csv_line) do
    csv_line
    |> split_csv_line()
    |> create_food_truck()
  end

  @spec split_csv_line(String.t) :: list(String.t)
  defp split_csv_line(csv_line) do
    csv_line
    |> String.split(",")
  end

  @spec create_food_truck(list(String.t)) :: %FoodTruck.FoodTruck{}
  defp create_food_truck(parsed_line) do
    %FoodTruck.FoodTruck{
      location_id: Enum.fetch!(parsed_line, 0),
      applicant: Enum.fetch!(parsed_line, 1),
      facility_type: Enum.fetch!(parsed_line, 2),
      cnn: Enum.fetch!(parsed_line, 3),
      location_description: Enum.fetch!(parsed_line, 4),
      address: Enum.fetch!(parsed_line, 5),
      block_lot: Enum.fetch!(parsed_line, 6),
      block: Enum.fetch!(parsed_line, 7),
      lot: Enum.fetch!(parsed_line, 8),
      permit: Enum.fetch!(parsed_line, 9),
      status: Enum.fetch!(parsed_line, 10),
      food_items: Enum.fetch!(parsed_line, 11),
      x: Enum.fetch!(parsed_line, 12),
      y: Enum.fetch!(parsed_line, 13),
      latitude: Enum.fetch!(parsed_line, 14),
      longitude: Enum.fetch!(parsed_line, 15),
      schedule: Enum.fetch!(parsed_line, 16),
      days_hours: Enum.fetch!(parsed_line, 17),
      noi_sent: Enum.fetch!(parsed_line, 18 ),
      approved: Enum.fetch!(parsed_line, 19),
      received: Enum.fetch!(parsed_line, 20),
      prior_permit: Enum.fetch!(parsed_line, 21),
      expiration_date: Enum.fetch!(parsed_line, 22),
      location: stitch_location(parsed_line, 23, 24),
      fire_prevention_districts: Enum.fetch!(parsed_line, 25),
      police_districts: Enum.fetch!(parsed_line, 26),
      supervisor_districts: Enum.fetch!(parsed_line, 27),
      zip_codes: Enum.fetch!(parsed_line, 28),
      neighborhoods_old: Enum.fetch!(parsed_line, 29),

    }
  end

  defp stitch_location(parsed_line, latitude_index, longitude_index) do
    Enum.fetch!(parsed_line, latitude_index) <> "," <> Enum.fetch!(parsed_line, longitude_index)
    |> String.replace("\"", "")
  end
end
