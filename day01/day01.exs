# tpaschalis 2021-12-01
# Advent of Code 2021 - Day 01

# {:ok, input} = File.read("input.sample")
{:ok, input} = File.read("input.txt")

lines = input |> String.split("\n", trim: true) |> Enum.map(&String.to_integer/1)

# Part 1
pairs = Enum.chunk_every(lines, 2, 1) |> Enum.drop(-1)
res1 = Enum.filter(pairs, fn [a, b] -> a < b end) |> Enum.count()

# Part 2
windows =
  Enum.chunk_every(lines, 3, 1)
  |> Enum.map(fn x -> Enum.sum(x) end)
  |> Enum.chunk_every(2, 1)
  |> Enum.drop(-1)

res2 = Enum.filter(windows, fn [a, b] -> a < b end) |> Enum.count()

IO.inspect(res1)
IO.inspect(res2)
