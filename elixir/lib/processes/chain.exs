defmodule Chain do
  # gets run in a seperate process each time
  def counter(next_pid) do
    receive do
      n ->
        send(next_pid, n + 1)
    end
  end

  def create_processes(n) do
    code_to_run = fn _, send_to ->
      spawn(Chain, :counter, [send_to])
    end

    # spawn a new process that runs the counter function,
    # using the third param of spawn to pass the acc's current value (initially self)
    last = Enum.reduce(1..n, self(), code_to_run)
    send(last, 0)
    # start the count by sending a zero to the last process
    receive do
      # and wait for the result to come back to us
      final_answer when is_integer(final_answer) ->
        "Result is #{inspect(final_answer)}"
    end
  end

  def run(n) do
    :timer.tc(Chain, :create_processes, [n])
    |> IO.inspect()
  end
end

# The reduce call will iterate over the range 1..n. Each time around, it will pass an
# accumulator as the second parameter to its function. We set the initial value of
# that accumulator to self, our PID.

# run this in the console to spawn 1 million processes
# elixir --erl "+P 1000000" -r lib/processes/chain.exs -e "Chain.run(1000000)"

# takes around 2.5 seconds to run 1 million processes
# {2580424, "Result is 1000000"}
