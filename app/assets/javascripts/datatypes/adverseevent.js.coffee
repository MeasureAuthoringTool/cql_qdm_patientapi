###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}

###
Data elements that meet criteria using this datatype should document the Adverse
Event and its corresponding value set.
###
class CQL_QDM.AdverseEvent extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_facilityLocation = @entry.facility?['name']
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    @_severity = @entry.severity
    @_type = @entry.type

  ###
  @returns {Code}
  ###
  facilityLocation: ->
    cql.Code(@_facilityLocation.code, @_facilityLocation.code_system)

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
  severity: ->
    cql.Code(@_severity.code, @_severity.code_system)

  ###
  @returns {Code}
  ###
  type: ->
    cql.Code(@_type.code, @_type.code_system)
