defmodule AlgosTest do
  use ExUnit.Case
  doctest Questions
  doctest Stack

  test "greets the world" do
    assert Algos.hello() == :world
  end
end
