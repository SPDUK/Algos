defmodule Queue do
  @moduledoc """
    FIFO - First item in, First item out.

    Can only take things off from the front
    Can only add things to the back

    Erlang already has `queue` http://erlang.org/doc/man/queue.html but this is just for display purposes and not supposed to be the most efficient.
  """
  defstruct storage: [], capacity: 30

  @doc """
    Returns a new Queue struct `%Queue{storage:[], capacity: 30}`
  """
  def new, do: %Queue{}

  @doc """
    Pattern matches out the elements in the storage and the capacity amount, if the amount of elements is already at capacity send a message and return the queue,
    otherwise add the value to the front of the storage and return the queue
  """
  def enqueue(%Queue{storage: elements, capacity: capacity} = queue, value) do
    if length(elements) == capacity do
      IO.puts("Max capacity reached, remove an element before adding a new one")
      queue
    else
      %Queue{queue | storage: [value | elements]}
    end
  end

  @doc """
    If the storage is empty and trying to remove, show an error message and return the queue
  """
  def dequeue(%Queue{storage: [], capacity: _} = queue) do
    IO.puts("You must first add an item to the queue to remove it")
    queue
  end

  @doc """
    Drops the last item from the list of elements and returns the queue.
  """
  def dequeue(%Queue{storage: elements, capacity: _} = queue) do
    %Queue{queue | storage: Enum.drop(elements, -1)}
  end

  @doc """
    Pattern matches the head of the storage list and returns it.
  """
  def peek(%Queue{storage: [head | _tail], capacity: _}) do
    head
  end
end
