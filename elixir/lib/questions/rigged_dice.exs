defmodule DiceRoller do
  def throw_rigged do
    rand = :random.uniform()

    cond do
      rand < 0.156 -> 1
      rand < 0.312 -> 2
      rand < 0.468 -> 3
      rand < 0.624 -> 4
      rand < 0.78 -> 5
      true -> 6
    end
  end
end

# 16.7

IO.puts(DiceRoller.throw_rigged())

# Create a rigged dice function that 22% of the time returns the number 6.
#  The rest of the time it returns the integers 1,2,3,4,5 uniformly.
