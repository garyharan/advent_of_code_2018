defmodule Day14 do

  def next_ten(iterations) when is_integer(iterations) do
    {tuple, _index1, _index2} = Day14.generate(iterations + 10)

    tuple
    |> Tuple.to_list
    |> Enum.slice(iterations, 10)
    |> Enum.join("")
  end

  def generate(iterations) when is_integer(iterations) do
    Day14.generate({{3,7}, 0, 1, iterations})
  end

  def generate({tuple, index1, index2, 0}) do
    {tuple, index1, index2}
  end

  def generate({tuple, index1, index2, iterations}) do
    elven_digits = Integer.digits(elem(tuple, index1) + elem(tuple, index2))

    tuple = Day14.append_digits_to_tuple(tuple, elven_digits)

    Day14.generate({
      tuple,
      Day14.calculate_new_index(tuple, index1),
      Day14.calculate_new_index(tuple, index2),
      iterations - 1
    })
  end

  def append_digits_to_tuple(accumulator, [head | tail]) do
    append_digits_to_tuple(Tuple.append(accumulator, head), tail)
  end

  def append_digits_to_tuple(accumulator, []) do
    accumulator
  end

  def calculate_new_index(tuple, index) do
    len       = tuple_size(tuple)
    new_index = elem(tuple, index) + 1 + index

    if new_index >= len do
      rem(new_index, len)
    else
      new_index
    end
  end
end
