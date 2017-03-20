###
Represents a CQL 'quantity' for use in the CQL execution engine.
###
class Quantity extends Expression
  constructor: (quantity) ->
    super
    @unit = quantity.unit
    @value = parseInt(quantity.value)

  exec: (ctx) ->
    @
  
  toString: () ->
    "#{@value} '#{@unit}'"
  
  sameOrBefore: (other) ->
    if other instanceof Quantity and other.unit == @unit
      @value <= parseInt(other.value)
    else
      null

  sameOrAfter: (other) ->
    if other instanceof Quantity and other.unit == @unit
      @value >= parseInt(other.value)
    else
      null

  after: (other) ->
    if other instanceof Quantity and other.unit == @unit
      @value > parseInt(other.value)
    else
      null

  before: (other) ->
    if other instanceof Quantity and other.unit == @unit
      @value < parseInt(other.value)
    else
      null
      
  equals: (other) ->
    @unit == other.unit && @value == other.value
