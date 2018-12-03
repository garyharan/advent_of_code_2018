defmodule Day1 do
  @moduledoc """
  Documentation for Day1.
  """

  def final_frequency do
    frequencies()
    |> sum_list(0)
  end

  def sum_list([head | tail], accumulator) do
    sum_list(tail, head + accumulator)
  end

  def sum_list([], accumulator) do
    accumulator
  end

  def frequencies do
    raw_frequencies()
    |> String.split("\n", trim: true)
    |> Enum.map(fn x -> String.to_integer(x) end)
  end

  defp raw_frequencies do
    File.read!("lib/frequency_inputs.txt")
  end
end
