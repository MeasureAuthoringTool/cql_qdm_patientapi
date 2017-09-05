###
Represents a CQL 'Ratio' for use in the CQL execution engine.
###
class Ratio
  constructor: (ratio) ->
    @numerator = ratio.numerator
    @denominator = ratio.denominator

  exec: (ctx) ->
    @
  
  toString: () ->
    "#{@numerator.toString()} '#{@denominator.toString()}'"
