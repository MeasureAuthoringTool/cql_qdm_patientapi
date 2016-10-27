###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}


###
Unlike other QDM datatypes, the Care Goal datatype does not indicate a
specific context of use. Instead, to meet this criterion, there must be
documentation of a care goal as defined by the Care Goal QDM category and
its corresponding value set.
###
class CQL_QDM.CareGoal extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry

    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    @_relatedTo = @entry.relatedTo
    @_targetOutcome = @entry.targetOutcome

  ###
  @returns {Interval<Date>}
  ###
  relevantPeriod: ->
    low = cql.DateTime.fromDate(@_relevantPeriodLow.toDate())
    high = cql.DateTime.fromDate(@_relevantPeriodHigh.toDate())
    new cql.Interval(low, high)

  ###
  @returns {Code}
  ###
  relatedTo: ->
    cql.Code(@_relatedTo.code, @_relatedTo.code_system)

  ###
  @returns {Quantity | Code}
  ###
  targetOutcome: ->
    if @_targetOutcome?['unit']?
      new Quantity({unit: @_targetOutcome['unit'], value: @_targetOutcome['value']})
    else
      cql.Code(@_targetOutcome.code, @_targetOutcome.code_system)
