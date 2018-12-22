defmodule Questions do
  @moduledoc """
    Some answers to some typical interview/programming questions.
  """

  @doc """
  In elixir you can't do simply use to_integer on a string such as "003-", it will error. Instead we have to use Integer.parse, which returns a tuple, we pattern match out the reversed integer and don't care about the non-integer part of the tuple.
  """
  def reverse_int(n) do
    {reversed, _} =
      n
      |> Integer.to_string()
      |> String.split("")
      |> Enum.reverse()
      |> Enum.join("")
      |> Integer.parse()

    # if the number came in as a negative integer, return it negative
    if n < 0 do
      reversed * -1
    else
      reversed
    end
  end
end
