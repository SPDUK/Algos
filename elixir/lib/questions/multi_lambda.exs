test_num = fn
  x when is_number(x) and x > 0 ->
    :positive

  0 ->
    :zero

  x when is_number(x) and x < 0 ->
    :negative
end

# :positive
IO.inspect(test_num.(100))
# :zero
IO.inspect(test_num.(0))
# :negative
IO.inspect(test_num.(-90))
