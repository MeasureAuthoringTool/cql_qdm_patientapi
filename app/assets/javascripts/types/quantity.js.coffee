###
Represents a CQL 'quantity' for use in the CQL execution engine.
###
class Quantity extends Expression
  
  ###
  @param {Object} quantity - the quantity to represent
  ###
  constructor: (quantity) ->
    super
    @unit = quantity.unit
    @value = parseInt(quantity.value)

  ###
  @param {Object} ctx - the context to execute this type with
  ###
  exec: (ctx) ->
    @

  ###
  Convert this Quantity to a string representation
  ###
  toString: ->
    "#{@value} '#{@unit}'"

  ###
  @param {Quantity} other - the Quantity to compare to
  ###
  sameOrBefore: (other) ->
    if other instanceof Quantity and other.unit == @unit
      @value <= parseInt(other.value)
    else
      null

  ###
  @param {Quantity} other - the Quantity to compare to
  ###
  sameOrAfter: (other) ->
    if other instanceof Quantity and other.unit == @unit
      @value >= parseInt(other.value)
    else
      null

  ###
  @param {Quantity} other - the Quantity to compare to
  ###
  after: (other) ->
    if other instanceof Quantity and other.unit == @unit
      @value > parseInt(other.value)
    else
      null

  ###
  @param {Quantity} other - the Quantity to compare to
  ###
  before: (other) ->
    if other instanceof Quantity and other.unit == @unit
      @value < parseInt(other.value)
    else
      null
      
  equals: (other) ->
    if other.unit? && other.value?
      @unit == other.unit && @value == other.value
    else
      null
