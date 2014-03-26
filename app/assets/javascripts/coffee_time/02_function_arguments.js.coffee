# Splats:
race = (winner, runners...) ->
  print winner, runners

# Default values (and no return is needed)
fill = (container, liquid = "coffee") ->
  "Filling the #{container} with #{liquid}..."

rice "one", "two"
# but still need () in when no args are passed
# rice #won't work :-)
