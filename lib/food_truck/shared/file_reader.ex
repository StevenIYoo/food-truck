defmodule FoodTruck.FileReader do
  require Logger

  @moduledoc """
    File Helper for returning the raw file contents from the local lib directory
  """

  @file_path Path.expand("../files", __DIR__)

  @doc "read contents of file"
  @spec read_file(String.t) :: String.t
  def read_file(file_name \\ "Mobile_Food_Facility_Permit.csv") do
    File.read!(@file_path <> "/#{file_name}")
  end

  @doc "Get local file path"
  @spec get_file_path() :: String.t
  def get_file_path() do
    @file_path
  end
end
