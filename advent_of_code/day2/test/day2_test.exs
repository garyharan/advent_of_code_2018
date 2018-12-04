defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  test "counts the characters" do
    assert Day2.count_characters("aabbcc") == %{
      ?a => 2,
      ?b => 2,
      ?c => 2
    }

    assert Day2.count_characters("bababc") == %{
      ?a => 2,
      ?b => 3,
      ?c => 1
    }
  end

  test "counts the maximum counts for each twice and threes" do
    assert Day2.get_row_multipliers("abcdef") == {0, 0}
    assert Day2.get_row_multipliers("bababc") == {1, 1}
    assert Day2.get_row_multipliers("abbcde") == {1, 0}
    assert Day2.get_row_multipliers("abcccd") == {0, 1}
    assert Day2.get_row_multipliers("aabcdd") == {1, 0}
    assert Day2.get_row_multipliers("abcdee") == {1, 0}
    assert Day2.get_row_multipliers("ababab") == {0, 1}
  end

  test "calculates checksum" do
    assert Day2.checksum([
      "abcdef",
      "bababc",
      "abbcde",
      "abcccd",
      "aabcdd",
      "abcdee",
      "ababab"
    ]) == 12
  end

  test "calculates checksum from file" do
    assert Day2.checksum() == 8118
  end

  test "find closest differing id" do
    assert Day2.closest([
      "abcde",
      "fghij",
      "klmno",
      "pqrst",
      "fguij",
      "axcye",
      "wvxyz"
    ]) == "fgij" # ["fghij", "fguij"] are differing by a single char
  end

  test "finds closest differing id from file" do
    assert Day2.closest() == "jbbenqtlaxhivmwyscjukztdp"
  end
end
