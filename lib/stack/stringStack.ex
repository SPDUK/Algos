defmodule StringStack do
  @moduledoc """
    LIFO - Last item in, first item out.

    The same as a normal stack, but using a string to store our stack seperated by commas.

  ### Examples
        iex(1)> str = StringStack.new
        %StringStack{storage: ""}
        iex(2)> str = str |> StringStack.push("red")
        %StringStack{storage: "red"}
        iex(3)> str = str |> StringStack.push("yellow")
        %StringStack{storage: "red,yellow"}
        iex(4)> str = str |> StringStack.push("green")
        %StringStack{storage: "red,yellow,green"}
        iex(5)> str = str |> StringStack.pop
        %StringStack{storage: "red,yellow"}
        iex(6)> str = str |> StringStack.pop
        %StringStack{storage: "red"}
        iex(7)> str = str |> StringStack.pop
        %StringStack{storage: ""}
        iex(8)> str = str |> StringStack.pop
        ** (RuntimeError) String stack is empty!
  """
  defstruct storage: ""

  def new, do: %StringStack{}

  @doc """
    if there is currently no element in the storage, just return the storage with the element being the only thing in the stack
  """
  def push(%StringStack{storage: ""}, element) do
    %StringStack{storage: element}
  end

  @doc """
    if there is an item in the stack already, return the previous stack and join the new element on to the end with a comma between the two
  """
  def push(stack, element) do
    %StringStack{stack | storage: "#{stack.storage},#{element}"}
  end

  def pop(%StringStack{storage: ""}), do: raise("String stack is empty!")

  @doc """
    Splits on each comma, drops the last item from the list and joins it back together to a string, returns the StringStack with the updated stack
  """
  def pop(%StringStack{storage: stack}) do
    new_stack =
      stack
      |> String.split(",", trim: true)
      |> Enum.drop(-1)
      |> Enum.join(",")

    %StringStack{storage: new_stack}
  end

  @doc """
    Splits on each comma and returns the length of that list.
  """
  def depth(%StringStack{storage: elements}) do
    elements
    |> String.split(",", trim: true)
    |> length()
  end
end
