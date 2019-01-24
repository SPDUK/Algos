defmodule Processes do
  import :timer, only: [sleep: 1]

  # spawn link to start a process
  def sadness(pid) do
    send(pid, {:ok, ":(.. bye"})
    raise ":("
  end

  def run do
    # Spawns the given function, links it to the current process, and returns its PID
    spawn_monitor(Processes, :sadness, [self()])
    sleep(500)

    receive do
      {:ok, msg} ->
        IO.puts(msg)
    end

    run()
  end
end

Processes.run()

# using spawn_link
# (EXIT from #PID<0.92.0>) an exception was raised:
# ** (RuntimeError) :(
# similar to exit it just kills both processes, but it shows an exception instead

# using spawn_monitor it sends the message first and then raises the error every 500ms
# 18:02:45.926 [error] Process #PID<0.97.0> raised an exception
# ** (RuntimeError) :(
#   lib/processes/processes2.exs:7: Processes.sadness/1
# :(.. bye

# 18:02:46.422 [error] Process #PID<0.98.0> raised an exception
# ** (RuntimeError) :(
#   lib/processes/processes2.exs:7: Processes.sadness/1
# :(.. bye
