
class Quantity extends Expression
  constructor: (json) ->
    super
    @unit = json.unit
    @value = json.value

  exec: (ctx) ->
    @
  
  toString: () ->
    "#{@value} '#{@unit}'"
  
  sameOrBefore: (other) ->
    if other instanceof Quantity and other.unit == @unit then @value <= other.value else null

  sameOrAfter: (other) ->
    if other instanceof Quantity and other.unit == @unit then @value >= other.value else null

  after: (other) ->
    if other instanceof Quantity and other.unit == @unit then @value > other.value else null

  before: (other) ->
    if other instanceof Quantity and other.unit == @unit then @value < other.value else null
