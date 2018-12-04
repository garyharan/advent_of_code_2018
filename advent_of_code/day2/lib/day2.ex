require IEx

defmodule Day2 do
  @moduledoc """
  Documentation for Day2.
  """

  def closest() do
    File.stream!("lib/ids.txt")
    |> Stream.map(&String.trim_trailing/1)
    |> Enum.to_list
    |> closest
  end

  def closest(ids) when is_list(ids) do
    ids
    |> Enum.map(&String.to_charlist/1)
    |> closest_charlists()
  end

  defp closest_charlists([head | tail]) do
    Enum.find_value(tail, &one_char_difference_string(&1, head)) || closest_charlists(tail)
  end

  defp one_char_difference_string(charlist1, charlist2) do
    charlist1
    |> Enum.zip(charlist2)
    |> Enum.split_with(fn {cp1, cp2} -> cp1 == cp2 end)
    |> case do
      {codepoints, [_single_differing_character]} ->
        codepoints
        |> Enum.map(fn {cp, _} -> cp end)
        |> List.to_string()
      {_, _} ->
        nil
    end
  end

  def checksum() do
    File.stream!("lib/ids.txt")
    |> Stream.map(&String.trim_trailing/1)
    |> Enum.to_list
    |> checksum()
  end

  def checksum(list) when is_list(list) do
    list
    |> Enum.map(fn box_id ->
      box_id
    |> get_row_multipliers()
    end)
    |> Enum.reduce({0, 0}, fn {twices, thrices}, {accumulated_twices, accumulated_thrices} ->
      {accumulated_twices + twices, accumulated_thrices + thrices}
    end)
    |> Tuple.to_list
    |> Enum.reduce(fn x, acc -> x * acc end)
  end

  def get_row_multipliers(string) when is_binary(string) do
    Day2.count_characters(string)
    |> get_row_multipliers()
  end

  def get_row_multipliers(hash) do
    has_a_twice  = Map.values(hash) |> Enum.any?(&(&1 == 2))
    has_a_thrice = Map.values(hash) |> Enum.any?(&(&1 == 3))

    {(if has_a_twice, do: 1, else: 0), (if has_a_thrice, do: 1, else: 0)}
  end

  def count_characters(string) when is_binary(string) do
    string
    |> String.to_charlist()
    |> Enum.reduce(%{}, fn codepoint, acc ->
      Map.update(acc, codepoint, 1, &(&1 + 1))
    end)
  end
end
