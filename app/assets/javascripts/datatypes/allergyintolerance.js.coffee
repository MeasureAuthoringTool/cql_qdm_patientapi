###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}

###
Data elements that meet criteria using this datatype should document the Allergy
or Intolerance and its corresponding value set.

Timing: The Prevalence Period references the time from the onset date to the
abatement date.
###
class CQL_QDM.AllergyIntolerance extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_prevalencePeriodLow = @entry.start_time
    @_prevalencePeriodHigh = @entry.end_time
    @_severity = @entry.severity
    @_type = @entry.type

  ###
  @returns {Interval<Date>}
  ###
  prevalencePeriod: ->
  low = cql.DateTime.fromDate(moment(@_prevalencePeriodLow, 'X').toDate())
  high = cql.DateTime.fromDate(moment(@_prevalencePeriodHigh, 'X').toDate())
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
