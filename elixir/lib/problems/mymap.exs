data = %{name: "Dave", state: "TX", likes: "Elixir"}

# uses pinning to keep the key variable the same without matching it,
# matching on data.name, not data.key
for key <- [:name, :likes] do
  %{^key => value} = data
  IO.puts(value)
end

# somewhat similar to this in JS
# const data = {name: "Dave", state: "TX", likes: "Elixir"}
# for (const key of ["name", "likes"]) {
#   const value = data[key]
#   console.log(value)
#  }

# update map, only works for keys currently on the map
new_name = %{data | name: "Jimmy"}
IO.inspect(new_name)

# Updating the old map with a new key
new_data = Map.put_new(data, :age, 30)
IO.inspect(new_data)

cast = [
  %{
    character: "Buttercup",
    actor: %{
      first: "Robin",
      last: "Wright"
    },
    role: "princess"
  },
  %{
    character: "Westley",
    actor: %{
      first: "Cary",
      last: "Elwes"
    },
    role: "farm boy"
  }
]

# get values from a nested structure
# ["buttercup", "Westley"]
cast
|> get_in([Access.all(), :character])
|> IO.inspect()

# princess
cast
|> get_in([Access.at(0), :role])
|> IO.inspect()

# updates the last name of each actor to uppercase
cast =
  cast
  |> get_and_update_in(
    [Access.all(), :actor, :last],
    fn val -> {val, String.upcase(val)} end
  )
  |> IO.inspect()
