defmodule Link do
  import :timer, only: [sleep: 1]

  def sad_function do
    sleep(500)
    exit(:boom)
  end

  def run do
    Process.flag(:trap_exit, true)
    # when one process exits abnormally it kills the other
    spawn_link(Link, :sad_function, [])

    receive do
      # MESSAGE RECEIVED: {:EXIT, #PID<0.97.0>, :boom}
      msg -> IO.puts("MESSAGE RECEIVED: #{inspect(msg)}")
    after
      1000 ->
        IO.puts("Nothing happened!")
    end
  end
end

Link.run()

#  If the intent is that a failure in one process should terminate another, then you need links.
# If instead you need to know when some other process exits for any reason, choose monitors.
