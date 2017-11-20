###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}

###
Represents the QDM.Id used in the execution engine.
###
class CQL_QDM.Id
  constructor: (@value, @namingSystem) ->

###
@returns {String}
###
namingSystem: ->
  @namingSystem

###
@returns {String}
###
value: ->
  @value
