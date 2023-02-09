defmodule FoodTruck.ParseContent do

  alias NimbleCSV.RFC4180, as: CSV
  alias FoodTruck.FoodTruckStruct

  @moduledoc """
    Helper Module for parsing a csv file where first line is header and remaining lines is content.
    Header is returned as a string.
    Content is returned as a list of comma delimited string with new lines stripped
  """

  @doc "Parses csv file into list of FoodTruckStruct.t based on new line removes header \n"
  @spec parse_content(String.t) :: list(String.t)
  def parse_content(content) do
    CSV.parse_string(content)
    |> Stream.map(
      fn [
        location_id, applicant, facility_type, cnn, location_description,
        address, block_lot, block, lot, permit, status, food_items,
        x, y, latitude, longitude, schedule, days_hours, noi_sent,
        approved, received, prior_permit, expiration_date, location,
        fire_prevention_districts, police_district, supervisor_districts,
        zip_codes, neighborhoods_old
      ] ->
        FoodTruckStruct.new_food_truck(
          location_id: location_id,
          applicant: applicant,
          facility_type: facility_type,
          cnn: cnn,
          location_description: location_description,
          address: address,
          block_lot: block_lot,
          block: block,
          lot: lot,
          permit: permit,
          status: status,
          food_items: food_items,
          x: x, y: y,
          latitude: latitude,
          longitude: longitude,
          schedule: schedule,
          days_hours: days_hours,
          noi_sent: noi_sent,
          approved: approved,
          received: received,
          prior_permit: prior_permit,
          expiration_date: expiration_date,
          location: location,
          fire_prevention_districts: fire_prevention_districts,
          police_districts: police_district,
          supervisor_districts: supervisor_districts,
          zip_codes: zip_codes,
          neighborhoods_old: neighborhoods_old
        )
      end
    )
    |> Enum.to_list()
  end
end
