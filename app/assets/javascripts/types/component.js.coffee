###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}

###
Represents a CQL 'component' for use in the CQL execution engine.
###
class CQL_QDM.Component
  constructor: (component) ->
    @_result = CQL_QDM.Helpers.formatResult(component.result)
    code = component?.code?.code
    code_system = component?.code?.code_system
    display = component?.result?.title
    @_code = new cql.Code(code, code_system, undefined, display)

  exec: (ctx) ->
    @
  
  toString: () ->
    "#{@_result.toString()} '#{@_code.toString()}'"

  ###
  @returns {Code}
  ###
  code: ->
    if @_code?
      @_code
    else
      null

  ###
  The model_info_file also lists Integer, Decimal, DateTime, Time, and Ratio.
  Decimal and Integer are covered under Quantity with a nil unit.
  Ratio is not yet supported with CQL although it appears in the QDM model.
  Time and Datetime are covered by Date
  @returns {Code|Quantity}
  ###
  result: ->
    if @_result?
      @_result
    else
      null

###
Represents a CQL 'component' for Laboratory Test Performed, which has a reference range.
###
class CQL_QDM.ResultComponent extends CQL_QDM.Component
  constructor: (component) ->
    super(component)
    referenceRangeLow = component.referenceRangeLow if component.referenceRangeLow && component.referenceRangeLow.scalar    # {"scalar": scalar, "unit": unit}}
    referenceRangeHigh = component.referenceRangeHigh if component.referenceRangeHigh && component.referenceRangeHigh.scalar
    referenceRangeLow_value = referenceRangeLow.scalar if referenceRangeLow
    referenceRangeHigh_value = referenceRangeHigh.scalar if referenceRangeHigh

    # If only one of low/high is defined, make interval with undefined endpoint
    @_referenceRange = new cql.Interval(referenceRangeLow_value, referenceRangeHigh_value) if referenceRangeLow_value || referenceRangeHigh_value
    # TODO: might need to deal with units in the future

  exec: (ctx) ->
    @

  toString: () ->
    "'#{@_referenceRange.toString()}'"

  ###
  @returns {Interval<Quantity>}
  ###
  referenceRange: ->
    if @_referenceRange?
      @_referenceRange
    else
      null
