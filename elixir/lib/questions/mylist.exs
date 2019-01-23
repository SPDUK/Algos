defmodule MyList do
  def reduce([], value, _), do: value

  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

  # warning: def mapsum/3 has multiple clauses and also declares default values. In such cases, the default values should be defined in a header.
  # def mapsum([], result, _func), do: result

  # def mapsum([head | tail], result \\ 0, func) do
  #   mapsum(tail, func.(head) + result, func)
  # end

  def mapsum([], _), do: 0

  def mapsum([head | tail], func) do
    func.(head) + mapsum(tail, func)
  end

  def max([]), do: raise("Can't find max of an empty list")
  def max([head | []]), do: head

  def max([head | tail]) do
    max(head, max(tail))
  end

  def caesar(list, n) do
    list
    |> Enum.map(&caesar_decode(&1, n))
  end

  def caesar_decode(char, num) when char + num > 122 do
    char + num - 26
  end

  def caesar_decode(char, num) when char + num < 122 do
    char + num
  end

  # using [1,2] ++ [3,4] ++ [5,6] concatenates the lists together and doesn't push to the list
  def span(from = to, to), do: [from]
  def span(from, to) when from < to, do: [from] ++ span(from + 1, to)
end

# 14
IO.inspect(MyList.mapsum([1, 2, 3], &(&1 * &1)))

# 888
IO.puts(MyList.max([777, 888, 666, 303]))
# 2002
IO.puts(MyList.max([8, 887, 99, 2002]))

# Uryyb-dbeyq
IO.puts(MyList.caesar('Hello World', 13))

# [30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40]
IO.inspect(MyList.span(30, 40))

# [30], 40
# [30]
