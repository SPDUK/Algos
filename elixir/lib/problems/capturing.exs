## Capturing with &
s = &"Bacon and #{&1}"
IO.puts(s.("custard"))

Enum.map([1, 2, 3, 4], &(&1 + 2))
Enum.map([1, 2, 3, 4], &IO.inspect/1)

l = &length/1
# 4
IO.inspect(l.([1, 2, 3, 4]))

IO.puts(Enum.reduce([1, 2, 3], 0, &+/2))
