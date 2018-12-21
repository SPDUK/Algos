defmodule AlgosTest do
  use ExUnit.Case
  doctest Algos

  test "greets the world" do
    assert Algos.hello() == :world
  end
end
