###
Represents a CQL 'expression' for use in the CQL execution engine.
###
class Expression
  ###
  @param {Object} json - the expression to represent
  ###
  constructor: (json) ->
    if json.operand?
      op = build(json.operand)
      if typeIsArray(json.operand) then @args = op else @arg = op

  ###
  @param {Object} ctx - the context to execute this type with
  ###
  exec: (ctx) ->
    @

  ###
  @param {Object} ctx - the context to execute this type with
  ###
  execArgs: (ctx) ->
    switch
      when @args? then (arg.exec(ctx) for arg in @args)
      when @arg? then @arg.exec(ctx)
      else null
