defmodule RecursiveLoop do
  @doc """
    A simple recursive loop that goes from any number supplied down to 1
  """
  def loop_n(n) do
    IO.puts(n)

    if n <= 1 do
      "Complete"
    else
      loop_n(n - 1)
    end
  end
end
