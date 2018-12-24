defmodule BinarySearch do
  def search([], _), do: raise(ArgumentError, message: "Can't search through an empty list")

  def search(list, item), do: start_search(Enum.with_index(list), item)

  defp start_search(list, item) do
    # if there is only one item before we split, (or we get lucky with first element in the list) return the first element
    {first, first_idx} = Enum.at(list, 0)

    if first == item do
      {:ok, first_idx}
    else
      middle = (length(list) / 2) |> round

      {lower, higher} = Enum.split(list, middle)

      {first_higher, idx} = Enum.at(higher, 0)

      # remove the first item from higher as we check for it, and if it isn't the item we are looking for we don't need it
      higher = Enum.drop(higher, 0)

      cond do
        first_higher == item -> {:ok, idx}
        first_higher < item -> start_search(higher, item)
        true -> start_search(lower, item)
      end
    end
  end
end
