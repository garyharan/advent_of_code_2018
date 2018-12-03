defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  test "converts file to list of integers" do
    frequencies = Day1.frequencies() |> Enum.to_list()
    assert List.first(frequencies) == 7
    assert List.last( frequencies) == -72362
  end

  test "trims the empty values" do
    assert Enum.count(Day1.frequencies) == 960
  end

  test "calculates the right value" do
    assert Day1.final_frequency() == 505
  end

  test "finds which frequency it reaches twice first" do
    assert Day1.calibration_level() == 72330
  end
end
