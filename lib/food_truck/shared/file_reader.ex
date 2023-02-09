defmodule FoodTruck.FileReader do
  require Logger

  @moduledoc """
    File Helper for returning the raw file contents from the local lib directory
  """

  @priv_file_path "static/csv/Mobile_Food_Facility_Permit.csv"

  @doc "read contents of file"
  @spec read_file(String.t) :: String.t
  def read_file(file_path), do: File.read!(file_path)

  def read_file(), do:
    File.read!(Path.join(:code.priv_dir(:food_truck), @priv_file_path))
end
