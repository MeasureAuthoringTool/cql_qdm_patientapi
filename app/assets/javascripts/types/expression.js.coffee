###
Represents a CQL 'expression' for use in the CQL execution engine.
###
class Expression
  constructor: (json) ->
    if json.operand?
      op = build(json.operand)
      if typeIsArray(json.operand) then @args = op else @arg = op

  exec: (ctx) ->
    @

  execArgs: (ctx) ->
    switch
      when @args? then (arg.exec(ctx) for arg in @args)
      when @arg? then @arg.exec(ctx)
      else null
