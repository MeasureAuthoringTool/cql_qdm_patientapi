###
Represents a CQL 'component' for use in the CQL execution engine.
###
class Component
  constructor: (component) ->
    result = {}
    result["unit"] = component.result.units
    result["value"] = component.result.scalar
    @result = new Quantity(result)
    @code = new cql.Code(component.code.code, component.code.code_system)

  exec: (ctx) ->
    @
  
  toString: () ->
    "#{@result.toString()} '#{@code.toString()}'"
