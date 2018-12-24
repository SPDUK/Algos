ExUnit.start()

defmodule BinarySearchTest do
  use ExUnit.Case

  test "finds the item at the start of the list" do
    assert BinarySearch.search([1, 2, 3, 8, 9], 1) == {:ok, 0}
  end

  test "finds the item near the start of the list" do
    assert BinarySearch.search([1, 2, 3, 8, 9], 2) == {:ok, 1}
  end

  test "finds the item near in the middle of the list" do
    assert BinarySearch.search([20, 30, 40, 60, 75, 88], 40) == {:ok, 2}
  end

  test "finds the item at the end of the list" do
    assert BinarySearch.search([23, 48, 88, 97, 98, 99], 99) == {:ok, 5}
  end

  test "finds the correct number" do
    assert BinarySearch.search(
             [2738, 2889, 3004, 3483, 8484, 9999, 10005, 98373, 888_888, 982_687, 999_992],
             982_687
           ) == {:ok, 9}
  end
end
