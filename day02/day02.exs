# tpaschalis 2021-12-08
# Advent of Code 2021 - Day 02

# {:ok, input} = File.read("input.sample")

{:ok, input} = File.read("input.txt")

## Part 1
lines = input |> String.split("\n", trim: true)

depth =
  lines
  |> Enum.reduce(0, fn x, acc ->
    case x do
      "up " <> rest ->
        acc - String.to_integer(rest)

      "down " <> rest ->
        acc + String.to_integer(rest)

      "forward " <> _rest ->
        acc + 0
    end
  end)

hor =
  lines
  |> Enum.reduce(0, fn x, acc ->
    case x do
      "up " <> _rest ->
        acc + 0

      "down " <> _rest ->
        acc + 0

      "forward " <> rest ->
        acc + String.to_integer(rest)
    end
  end)

IO.inspect(depth * hor)

## Part 2
res =
  lines
  |> Enum.reduce({0, 0, 0}, fn x, {aim, depth, forward} ->
    case x do
      "up " <> rest ->
        {aim - String.to_integer(rest), depth, forward}

      "down " <> rest ->
        {aim + String.to_integer(rest), depth, forward}

      "forward " <> rest ->
        {aim, depth + aim * String.to_integer(rest), forward + String.to_integer(rest)}
    end
  end)

{_, depth, hor} = res
IO.inspect(depth * hor)
