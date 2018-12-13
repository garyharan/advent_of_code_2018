defmodule Day3Test do
  use ExUnit.Case
  doctest Day3

  setup do
    {:ok,
     claims_string: "
      #1 @ 1,3: 4x4
      #2 @ 3,1: 4x4
      #3 @ 5,5: 2x2
    ",
     claims_list: [
       [1, 1, 3, 4, 4],
       [2, 3, 1, 4, 4],
       [3, 5, 5, 2, 2]
     ]}
  end

  test "parses a single claim" do
    assert Day3.parse_claim("#1 @ 1,3: 4x4") == [1, 1, 3, 4, 4]
  end

  test "parses multiple lines", context do
    assert Day3.parse_claims(context[:claims_string]) == context[:claims_list]
  end

  test "finds claims that overlaps", context do
    assert Day3.overlaps(context[:claims_list]) == 4
  end

  test "counts how many overlaps in the input file" do
    assert Day3.parse_claims_file("lib/claims.txt") |> Day3.overlaps == 107820
  end

  test "find non overlaping claim", context do
    assert context[:claims_list] |> Day3.non_overlapping_claim() == 3
    assert Day3.parse_claims_file("lib/claims.txt") |> Day3.non_overlapping_claim() == 661
  end
end
