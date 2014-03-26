class Animal
  constructor: (@name) ->

  move: (meters) ->
    alert @name + " moved #{meters}m."

class Gecko extends Animal
  move: ->
    alert "No, I don't want to..."
    super 2

class Horse extends Animal
  move: ->
    alert "Galloping..."
    super 45

sam = new Gecko "Gecky the Leopard Gecko"
tom = new Horse "Tommy the Palomino (whatever this is)"

sam.move()
tom.move()
