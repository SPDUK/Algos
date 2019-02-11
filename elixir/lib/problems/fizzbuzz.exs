#   Write a function that takes three arguments. If the first two are zero, return
# “FizzBuzz.” If the first is zero, return “Fizz.” If the second is zero, return
# “Buzz.” Otherwise return the third argument.

defmodule FB do
  def get_fizzbuzz(0, 0, _), do: "Fizzbuzz"
  def get_fizzbuzz(0, _, _), do: "Fizz"
  def get_fizzbuzz(_, 0, _), do: "Buzz"
  def get_fizzbuzz(_, _, x), do: x

  def fizzbuzz(n) do
    get_fizzbuzz(rem(n, 3), rem(n, 5), n)
  end
end

for n <- 1..30, do: IO.inspect(FB.fizzbuzz(n))
IO.puts("__________________")

#############################################
# Using basic pattern matching with an anonymous function, if the arguments line up as expected we return the expected string.
get_fizzbuzz = fn
  0, 0, _ ->
    "FizzBuzz"

  0, _, _ ->
    "Fizz"

  _, 0, _ ->
    "Buzz"

  _, _, x ->
    x
end

fizzbuzz = fn n ->
  get_fizzbuzz.(rem(n, 3), rem(n, 5), n)
end

for n <- 1..30, do: IO.inspect(fizzbuzz.(n))
