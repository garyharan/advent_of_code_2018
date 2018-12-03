defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  test "converts file to list of integers" do
    assert List.first(Day1.frequencies) == 7
    assert List.last( Day1.frequencies) == -72362
  end

  test "trims the empty values" do
    assert Enum.count(Day1.frequencies) == 960
  end

  test "calculates the right value" do
    assert Day1.final_frequency() == 505
  end
end
