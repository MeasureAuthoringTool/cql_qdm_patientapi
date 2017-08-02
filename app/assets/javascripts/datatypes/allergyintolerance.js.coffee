###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}

###
Data elements that meet criteria using this datatype should document the Allergy
or Intolerance and its corresponding value set.

Timing: The Prevalence Period references the time from the onset date to the
abatement date.
###
class CQL_QDM.AllergyIntolerance extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_prevalencePeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    if @entry.end_time
      @_prevalencePeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    else
      # No end time; high is set to infinity
      @_prevalencePeriodHigh = CQL_QDM.Helpers.infinityDateTime()
    @_severity = @entry.severity
    @_type = @entry.type

  ###
  Author date time is only present when this data type has been negated.
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime

  ###
  @returns {Interval<Date>}
  ###
  prevalencePeriod: ->
    low = @_prevalencePeriodLow
    high = @_prevalencePeriodHigh
    new cql.Interval(low, high)

  ###
  @returns {Code}
  ###
  severity: ->
    new cql.Code(@_severity?.code, @_severity?.code_system)

  ###
  @returns {Code}
  ###
  type: ->
    new cql.Code(@_type?.code, @_type?.code_system)
