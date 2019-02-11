mult = for x <- [1, 2, 3], y <- [1, 2, 3], do: {x, y, x * y}
IO.inspect(mult)
# [
#   {1, 1, 1},
#   {1, 2, 2},
#   {1, 3, 3},
#   {2, 1, 2},
#   {2, 2, 4},
#   {2, 3, 6},
#   {3, 1, 3},
#   {3, 2, 6},
#   {3, 3, 9}
# ]
# Loops over the right list first to create a multiplication table
# the left list is inside similar to a nested loop but does not create a
# list for the inner loop, but instead treats it like one large list,
# and returns it as one large list (a for loop inside another would return lists inside one big list)

easy_to_see = for x <- [100, 200, 300], y <- [1, 2, 3], do: {x, y}
IO.inspect(easy_to_see)
# [
#   {100, 1},
#   {100, 2},
#   {100, 3},
#   {200, 1},
#   {200, 2},
#   {200, 3},
#   {300, 1},
#   {300, 2},
#   {300, 3}
# ]
nested =
  for x <- [100, 200, 300] do
    for y <- [1, 2, 3] do
      {x, y}
    end
  end

IO.inspect(nested)
# [
#   [{100, 1}, {100, 2}, {100, 3}],
#   [{200, 1}, {200, 2}, {200, 3}],
#   [{300, 1}, {300, 2}, {300, 3}]
# ]
# same as above, except the list is in a new list

nested |> List.flatten() |> IO.inspect()
# [
#   {100, 1},
#   {100, 2},
#   {100, 3},
#   {200, 1},
#   {200, 2},
#   {200, 3},
#   {300, 1},
#   {300, 2},
#   {300, 3}
# ]

multiplication_table =
  for x <- 1..9, y <- 1..9, into: %{} do
    {{x, y}, x * y}
  end

IO.inspect(multiplication_table[{7, 6}])
# 42
