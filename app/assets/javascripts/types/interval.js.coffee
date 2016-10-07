
class Interval extends Expression
  constructor: (interval) ->
    super
    @low = interval.low
    @high = interval.high

  exec: (ctx) ->
    @
  
  toString: () ->
    "#{@low} - #{@high}"
