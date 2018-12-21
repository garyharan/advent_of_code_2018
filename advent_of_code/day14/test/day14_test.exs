defmodule Day14Test do
  use ExUnit.Case
  doctest Day14

  test "calculates next step" do
    assert Day14.generate(1)                 == {{3, 7, 1, 0}, 0, 1}
    assert Day14.generate(15)                == {{3, 7, 1, 0, 1, 0, 1, 2, 4, 5, 1, 5, 8, 9, 1, 6, 7, 7, 9, 2}, 8, 4}
  end

  test "next ten" do
    assert Day14.next_ten(9)    == "5158916779"
    assert Day14.next_ten(5)    == "0124515891"
    assert Day14.next_ten(18)   == "9251071085"
    assert Day14.next_ten(2018) == "5941429882"

    assert Day14.next_ten(880751) == ""
  end

  test "calculates new index" do
    assert Day14.calculate_new_index({3,7,1,0}, 0) == 0
  end

  test "append_list_items_to_tuple" do
    assert Day14.append_digits_to_tuple({3, 7}, [1, 0]) == {3, 7, 1, 0}
  end
end
