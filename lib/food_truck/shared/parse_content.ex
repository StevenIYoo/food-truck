defmodule FoodTruck.ParseContent do

  @moduledoc """
    Helper Module for parsing a csv file where first line is header and remaining lines is content.
    Header is returned as a string.
    Content is returned as a list of comma delimited string with new lines stripped
  """

  @doc "Parses csv file into list of strings based on new line \n"
  @spec parse_content(String.t) :: list(String.t)
  def parse_content(content) do
    content
    |> String.split("\n")
    |> remove_new_lines()
  end

  @doc "Returns first line assumed to be header"
  @spec get_header(list(String.t)) :: String.t
  def get_header([head | _tail] = _parsed_list), do: head

  @doc "Returns rest of content"
  @spec get_food_trucks(list(String.t)) :: list(String.t)
  def get_food_trucks([_head | tail] = _parsed_list), do: tail

  defp remove_new_lines(parsed_list) do
    parsed_list
    |> Enum.map(&(String.replace(&1, "\n", "")))
  end
end
