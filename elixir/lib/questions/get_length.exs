defmodule GetLength do
  def list_len([]), do: 0
  # no function body to show the default values
  def list_len(list \\ [], acc \\ 0)
  def list_len([], acc), do: acc

  def list_len([_head | tail], acc) do
    list_len(tail, acc + 1)
  end
end

IO.puts(GetLength.list_len([1, 2, 3, 4, 5]))
IO.puts(GetLength.list_len([]))
IO.puts(GetLength.list_len([1]))

# IO.puts(GetLength.create_range(1, 50))
