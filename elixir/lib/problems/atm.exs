defmodule ATM do
  def withdraw(n) do
    calc_withdraw(n, [0, 0, 0])
  end

  def calc_withdraw(n, acc) when n >= 100 and rem(n, 20) == 0 do
    calc_withdraw(n - 100, update_list(acc, 0))
  end

  def calc_withdraw(n, acc) when n >= 50 and rem(n, 20) != 0 do
    calc_withdraw(n - 50, update_list(acc, 1))
  end

  def calc_withdraw(n, acc) when n > 0 do
    calc_withdraw(n - 20, update_list(acc, 2))
  end

  def calc_withdraw(n, acc), do: acc

  defp update_list(list, idx) do
    List.update_at(list, idx, &(&1 + 1))
  end
end

defmodule TestSolution do
  use ExUnit.Case

  defp _test(testnum, val, sol) do
    IO.puts("Test #{testnum}")
    assert ATM.withdraw(val) == sol
  end

  test "It should work for basic tests" do
    _test(1, 40, [0, 0, 2])
    _test(2, 250, [2, 1, 0])
    _test(3, 260, [2, 0, 3])
    _test(4, 230, [1, 1, 4])
    _test(5, 60, [0, 0, 3])
  end
end

# Task
# An ATM ran out of 10 dollar bills and only has 100, 50 and 20 dollar bills.

# Given an amount between 40 and 10000 dollars (inclusive) and assuming that the ATM wants to use as few bills as possible, determinate the minimal number of 100, 50 and 20 dollar bills the ATM needs to dispense (in that order).

# Example
# For n = 250, the result should be [2, 1, 0].

# For n = 260, the result should be [2, 0, 3].

# For n = 370, the result should be [3, 1, 1].

# Input/Output
# [input] integer n Amount of money to withdraw. Assume that n is always exchangeable with [100, 50, 20] bills.
# [output] integer array An array of number of 100, 50 and 20 dollar bills needed to complete the withdraw (in that order).
