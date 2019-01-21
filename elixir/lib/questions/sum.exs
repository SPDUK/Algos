defmodule Sum do
  def of(n) when n > 0 do
    of(n - 1) + n
  end

  # if n is not greater than 0, return that number
  def of(n), do: n
end
