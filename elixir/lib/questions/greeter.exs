# only if the name is the same for the greeter function and the function that is returned from greeter, it will greet the name (using pinning, the ^ symbol)

greeter = fn name, greeting ->
  fn
    ^name -> "#{greeting} #{name}"
    _ -> "I dont know that name"
  end
end

mr_valim = greeter.("Jose", "Oi!")
IO.puts(mr_valim.("Jose"))
#  "Oi! Jose"

IO.puts(mr_valim.("Ben"))
# "I dont know that name"
