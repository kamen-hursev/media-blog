weatherReport = (location) ->
  # Make an Ajax request to fetch the weather...
  [location, 72, "Mostly Sunny"]

[city, temp, forecast] = weatherReport "Berkeley, CA"

# for a class constructor
class Person
  constructor: (options) -> 
    {@name, @age, @height} = options

tim = new Person age: 4

# more complex examples here: coffeescript.org