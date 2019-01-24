defmodule SpawnBasic do
  def greet do
    receive do
      # pattern match similar to case, find the first message that matches
      {sender, msg} ->
        # sends a  message back  to the sender
        send(sender, {:ok, "Hello #{msg}"})
    end
  end
end

pid = spawn(SpawnBasic, :greet, [])
# send needs a pid to send the message to, and then the message
send(pid, {self(), "World!"})

receive do
  {:ok, message} ->
    IO.puts(message)
end

# after sending the first message (outside of module) the process inside the module will receive it
# when it receives the message it will match a tuple (we send {self(), "World"}) which is a pid and a string
# then our outside module process will recieve the message, match on {:ok, message} which the process inside the module sent.
# finally we will have created a "Hello World" by sending messages back and forth and put it in the console.
