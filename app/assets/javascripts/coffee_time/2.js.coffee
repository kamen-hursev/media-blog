# Existence:
alert "Have coffee!" if sleepy?

# Splats:
race = (winner, runners...) ->
  print winner, runners

# Array comprehensions:
cubes = (math.cube num for num in list)
