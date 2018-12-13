defmodule Day3 do
  @moduledoc """
  Documentation for Day3.
  """

  def parse_claim(string) do
    string
    |> String.trim()
    |> String.split(["#", " @ ", ",", ": ", "x"], trim: true)
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
  end

  def parse_claims(claims) do
    claims
    |> String.split("\n", trim: true)
    |> Enum.filter(fn line -> String.trim(line) != "" end)
    |> Enum.map(&parse_claim(&1))
  end

  def consolidate(claims) do
    Enum.reduce(claims, %{}, fn claim, acc ->
      [id, left, top, width, height] = claim

      Enum.reduce((left + 1)..(left+width), acc, fn x, acc ->
        Enum.reduce((top + 1)..(top + height), acc, fn y, acc ->
          Map.update(acc, {x, y}, [id], &[id | &1])
        end)
      end)
    end)
  end

  def overlaps(claims) do
    claims
    |> consolidate
    |> Enum.count(fn {_key, value} -> Enum.count(value) > 1 end)
  end

  def non_overlapping_claim(claims) do
    ids = claims
    |> consolidate
    |> Map.values |> Enum.group_by(fn list -> length(list) == 1 end)

    singles    = ids |> Map.get(true)  |> List.flatten |> Enum.uniq
    gregarious = ids |> Map.get(false) |> List.flatten |> Enum.uniq

    singles -- gregarious |> List.first
  end

  def parse_claims_file(file) do
    File.read!(file)
    |> parse_claims()
  end
end
