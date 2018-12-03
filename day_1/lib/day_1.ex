defmodule Day1 do
  @moduledoc """
  Documentation for Day1.
  """

  def final_frequency do
    frequencies()
    |> Enum.sum
  end

  def frequencies do
    raw_frequencies()
    |> String.split("\n", trim: true)
    |> Enum.map(fn x -> String.to_integer(x) end)
  end

  def raw_frequencies do
    File.read!("lib/frequency_inputs.txt")
  end
end
