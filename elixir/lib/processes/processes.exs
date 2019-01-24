defmodule Processes do
  import :timer, only: [sleep: 1]

  # spawn link to start a process
  def sadness(pid) do
    send(pid, {:ok, ":(.. bye"})
    exit(:sad_face)
  end

  def run do
    # Spawns the given function, links it to the current process, and returns its PID
    spawn_link(Processes, :sadness, [self()])
    sleep(500)

    receive do
      {:ok, msg} ->
        IO.puts(msg)
    end

    run()
  end
end

Processes.run()

# ** (EXIT from #PID<0.92.0>) :sad_face
# the sadness process will just exit and kill the run process with it, it doesn't matter if it is sleeping or not
