defmodule Day1 do
  @moduledoc """
  Documentation for Day1.
  """

  def final_frequency do
    frequencies()
    |> Enum.sum()
  end

  def calibration_level do
    Process.put({__MODULE__, 0}, true)

    frequencies()
    |> Stream.cycle()
    |> Enum.reduce_while(0, fn x, current_frequency ->
      new_frequency = current_frequency + x

      key = {__MODULE__, new_frequency}

      if Process.get(key) do
        {:halt, new_frequency}
      else
        Process.put(key, true)
        {:cont, new_frequency}
      end
    end)
  end

  def frequencies do
    raw_frequencies()
    |> Stream.map(fn line ->
      {integer, _leftover} = Integer.parse(line)
      integer
    end)
  end

  defp raw_frequencies do
    "lib/frequency_inputs.txt"
    |> File.stream!([], :line)
  end
end
