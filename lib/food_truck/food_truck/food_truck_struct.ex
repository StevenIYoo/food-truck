defmodule FoodTruck.FoodTruckStruct do
  @moduledoc """
    Constains the struct and type of `t` and provides functionality
    on retrieving
  """
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

  @type t :: %__MODULE__{
    location_id: String.t,
    applicant: String.t,
    facility_type: String.t,
    cnn: String.t,
    location_description: String.t,
    address: String.t,
    block_lot: String.t,
    block: String.t,
    lot: String.t,
    permit: String.t,
    status: String.t,
    food_items: String.t,
    x: String.t,
    y: String.t,
    latitude: String.t,
    longitude: String.t,
    schedule: String.t,
    days_hours: String.t,
    noi_sent: String.t,
    approved: String.t,
    received: String.t,
    prior_permit: String.t,
    expiration_date: String.t,
    location: String.t,
    fire_prevention_districts: String.t,
    police_districts: String.t,
    supervisor_districts: String.t,
    zip_codes: String.t,
    neighborhoods_old: String.t
  }

  @doc "returns a new food truck based on a passed keyword list"
  @spec new_food_truck(keyword(t)) :: t
  def new_food_truck(attributes) do
    __struct__(attributes)
  end

  @doc "returns a random food truck based on the list size"
  @spec get_random_food_truck(list(t)) :: t
  def get_random_food_truck([]), do: %__MODULE__{}
  def get_random_food_truck(food_trucks) do
    random_number = Enum.random(0..Enum.count(food_trucks) - 1)

    Enum.fetch!(food_trucks, random_number)
  end
end
