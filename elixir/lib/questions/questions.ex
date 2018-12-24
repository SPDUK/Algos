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
end
