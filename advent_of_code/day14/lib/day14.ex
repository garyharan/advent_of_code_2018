defmodule Day14 do
  def next_ten(iterations) when is_integer(iterations) do
    {binary, _index1, _index2} = Day14.generate(iterations + 10)

    binary
    |> Binary.part(iterations, 10)
    |> Binary.to_list()
    |> Enum.join("")
  end

  def generate(iterations) when is_integer(iterations) do
    Day14.generate({<<3,7>>, 0, 1, iterations})
  end

  def generate({binary, index1, index2, 0}) do
    {binary, index1, index2}
  end

  def generate({binary, index1, index2, iterations}) do
    elven_digits = Integer.digits(Binary.at(binary, index1) + Binary.at(binary, index2))

    binary = <<binary::binary, :erlang.list_to_binary(elven_digits)::binary>>

    Day14.generate({
      binary,
      Day14.calculate_new_index(binary, index1),
      Day14.calculate_new_index(binary, index2),
      iterations - 1
    })
  end

  def calculate_new_index(binary, index) do
    len       = byte_size(binary)
    new_index = Binary.at(binary, index) + 1 + index

    if new_index >= len do
      rem(new_index, len)
    else
      new_index
    end
  end
end
