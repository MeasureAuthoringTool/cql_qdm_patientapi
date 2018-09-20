###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}

###
Represents a QDM.Ratio for use in the CQL execution engine.
###
class CQL_QDM.Ratio
  constructor: (@numerator, @denominator) ->