defmodule FoodTruckWeb.FoodTruckView do
  use FoodTruckWeb, :view
  @moduledoc """
    renderers for food trucks to json
  """

  def render("food_truck.json", %{food_truck: food_truck}) do
    %{
      data: %{
        locationId: food_truck.location_id,
        applicant: food_truck.applicant,
        facilityType: food_truck.facility_type,
        cnn: food_truck.cnn,
        locationDescription: food_truck.location_description,
        address: food_truck.address,
        blockLot: food_truck.block_lot,
        block: food_truck.block,
        lot: food_truck.lot,
        permit: food_truck.permit,
        status: food_truck.status,
        foodItems: food_truck.food_items,
        x: food_truck.x,
        y: food_truck.y,
        latitude: food_truck.latitude,
        longitude: food_truck.longitude,
        schedule: food_truck.schedule,
        daysHours: food_truck.days_hours,
        noiSent: food_truck.noi_sent,
        approved: food_truck.approved,
        received: food_truck.received,
        priorPermit: food_truck.prior_permit,
        expirationDate: food_truck.expiration_date,
        location: food_truck.location,
        firePreventionDistricts: food_truck.fire_prevention_districts,
        policeDistricts: food_truck.police_districts,
        supervisorDistricts: food_truck.supervisor_districts,
        zipCodes: food_truck.zip_codes,
        neighborhoodsOld: food_truck.neighborhoods_old
      }
    }
  end
end
