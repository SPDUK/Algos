defmodule Spawn2 do
  def greet do
    receive do
      {sender, msg} ->
        send(sender, {:ok, "Hello #{msg}"})
        # allows us to see both messages, it would get stuck otherwise
        greet()
    end
  end
end

# here's a client
pid = spawn(Spawn2, :greet, [])
send(pid, {self(), "World!"})

receive do
  {:ok, message} ->
    IO.puts(message)
end

send(pid, {self(), "Kermit!"})

receive do
  {:ok, message} ->
    IO.puts(message)
after
  500 ->
    IO.puts("the greeter has gone away")
end
