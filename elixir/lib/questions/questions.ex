defmodule Questions do
  @moduledoc """
    Some answers to some typical interview/programming questions.
  """

  @doc """
  In elixir you can't do simply use to_integer on a string such as "003-", it will error. Instead we have to use Integer.parse, which returns a tuple, we pattern match out the reversed integer and don't care about the non-integer part of the tuple.


  ## Examples
      iex> Questions.reverse_int(940)
      49

      iex> Questions.reverse_int(-3006)
      -6003
  """
  def reverse_int(n) do
    {reversed, _} =
      n
      |> Integer.to_string()
      |> String.split("")
      |> Enum.reverse()
      |> Enum.join("")
      |> Integer.parse()

    # if the number came in as a negative integer, return it as a  negative
    reversed * sign(n)
  end

  @doc """
    Recreating Math.sign from javascript
  """
  def sign(num) do
    cond do
      !is_number(num) -> nil
      num > 0 -> 1
      num < 0 -> -1
      num == 0 -> 0
      num == -0 -> -0
    end
  end

  @doc """
    A simple program that takes in a number n and prints a pyramid n steps high
  """
  def pyramid(n) do
    for i <- 1..n do
      str = "#{String.duplicate("#", i)}#{String.duplicate(" ", n - i)}"
      IO.puts(str)
    end
  end

  ##### Some things for Programming Elixir book #####

  ## Anonymous functions

  list_concat = fn [a, b], [c, d] -> [a, b, c, d] end
  IO.inspect(list_concat.([1, 2], [99, 100]))
  # [1, 2, 99, 100]

  # using capturing
  sum = &(&1 + &2 + &3)
  IO.inspect(sum.(99, 8, 77))
  # 184

  pair_tuple_to_list = fn {a, b} -> [a, b] end
  IO.inspect(pair_tuple_to_list.({1234, 5678}))
  # [1234,5678]

  #   Write a function that takes three arguments. If the first two are zero, return
  # “FizzBuzz.” If the first is zero, return “Fizz.” If the second is zero, return
  # “Buzz.” Otherwise return the third argument.

  # Using basic pattern matching with an anonymous function, if the arguments line up as expected we return the expected string.
  fizzbuzz = fn
    0, 0, _ ->
      "FizzBuzz"

    0, _, _ ->
      "Fizz"

    _, 0, _ ->
      "Buzz"

    _, _, x ->
      x
  end

  say_fizzbuzz = fn n ->
    fizzbuzz.(rem(n, 3), rem(n, 5), n)
  end

  # uncomment to see fizzbuzz in console
  # for n <- 1..30, do: IO.inspect(say_fizzbuzz.(n))

  # The same but without anonymous functions, more "elixir like"? with function overloading
  # for n <- 1..30, do: IO.inspect(Questions.say_fizzbuzz2(n))

  def fizzbuzz2(0, 0, _), do: "Fizzbuzz"
  def fizzbuzz2(0, _, _), do: "Fizz"
  def fizzbuzz2(_, 0, _), do: "Buzz"
  def fizzbuzz2(_, _, x), do: x

  def say_fizzbuzz2(n) do
    fizzbuzz2(rem(n, 3), rem(n, 5), n)
  end
end
