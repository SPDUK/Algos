# convert float to string using erlang
# 1234.49
IO.puts(:erlang.float_to_binary(1234.48837, decimals: 2))

# get the system clock time
prev = System.monotonic_time()
next = System.monotonic_time()
diff = next - prev
IO.inspect(diff)

# getting the extension name with
IO.inspect(Path.extname("./capturing.exs"))

# puts the logged in user's name in the console
{name, _} = System.cmd("whoami", [])
IO.puts(name)
