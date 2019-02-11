defmodule GuessNumber do
  def guess(n, a..b) when n === div(a + b, 2), do: IO.puts("Your number is #{n}!")

  def guess(n, a..b) when n in a..b do
    mid = div(a + b, 2)
    IO.puts("Is it #{mid}?")

    # guess again from the lowest or highest number TO the middle, as we have already checked to see if that middle number is the correct one with the first guess function
    cond do
      n > mid -> guess(n, (mid + 1)..b)
      true -> guess(n, a..(mid - 1))
    end
  end

  def guess(n, a..b), do: raise("Number #{n} not in range #{a} to #{b}")
end

# Your number is 90!
GuessNumber.guess(90, 0..600)

# Your number is 509!
IO.inspect(GuessNumber.guess(509, 400..600))

# Your number is 3590!
IO.inspect(GuessNumber.guess(3590, -1493..6000))

# ** (RuntimeError) Number not in range
# IO.inspect(GuessNumber.guess(-1, 400..600))

# ** (RuntimeError) Number not in range
# IO.inspect(GuessNumber.guess(900, 400..-1))

# ** (RuntimeError) Number not in range
# GuessNumber.guess(100, 400..600)
