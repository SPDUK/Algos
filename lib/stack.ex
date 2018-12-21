defmodule Stack do
  @moduledoc """
    LIFO - Last item in, first item out.

    LIFO refers to the items coming in and going out, not the list itself, so in our case of using a linked list it still means the last item to go in will be the first item to go out, not that the first item in the list will be going out

    In Elixir lists are linked lists, so instead of the typical array, we have to use the start of a list to push/pop our items, not the end. We will be pushing to the front and popping from the front of the list.
  """

  # using defstruct will set the default value of Stack to be %{elements: []}
  # by using a struct it also guarentees at compile time that only these keys will exist on the map
  defstruct elements: []

  @doc """
    Returns a new stack struct, with the elements key as an empty list

  ## Examples
      iex> Stack.new()
      %Stack{elements: []}

  """
  def new, do: %Stack{}

  @doc """
    `%Stack{stack | elements: [ element | stack.elements]}` is the syntax for updating the stack.
    `%{stack | elements: [2,3,5]}` would keep everything else in the stack the same, but update the elements to [2,3,5].
    When using `|` we specify on the left what we wish to be updating and on the right what we want to update it with.
    So using `nums = [1,2,3]` then doing `nums = [0 | nums]` would return `[0,1,2,3]` and nums would be assigned to that, with 0 added to the head of the linked list.

  ## Examples
      iex> nums = Stack.new
      %Stack{elements: []}
      iex> nums = nums |> Stack.push(1)
      %Stack{elements: [1]}
      iex> nums = nums |> Stack.push(2)
      %Stack{elements: [2, 1]}
  """
  def push(stack, element) do
    %Stack{stack | elements: [element | stack.elements]}
  end

  @doc """
    If the parameters passed to pop pattern match to an empty list, raise an exception.
  """
  def pop(%Stack{elements: []}), do: raise("Stack is empty!")

  @doc """
    Return a tuple with the element being popped off the head and the leftover of the stack containing the tail.

  ### Examples
      iex> nums
      %Stack{elements: [2, 1]}
      iex> {_, nums} = Stack.pop(nums)
      {2, %Stack{elements: [1]}}
      iex> {_, nums} = Stack.pop(nums)
      {1, %Stack{elements: []}}
  """
  def pop(%Stack{elements: [head | tail]}) do
    {head, %Stack{elements: tail}}
  end

  @doc """
    Returns the length of the list passed in, length is a part of the standard library ex `[1,2,3].length -> 3`,
    however calling it length will conflict, so we call it depth instead.

  ### Examples
    iex(1)> Stack.new |> Stack.push(1) |> Stack.depth
    1
  """
  def depth(%Stack{elements: elements}), do: length(elements)
end
