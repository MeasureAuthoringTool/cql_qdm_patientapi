###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}

###
Data elements that meet criteria using this datatype should document the Adverse
Event and its corresponding value set.
###
class CQL_QDM.AdverseEvent extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_facilityLocation = @entry.facility
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    if @entry.end_time
      @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    else
      # No end time; high is set to infinity
      @_relevantPeriodHigh = CQL_QDM.Helpers.infinityDateTime()
    @_severity = @entry.severity
    @_type = @entry.type

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime

  ###
  @returns {Facility}
  ###
  facilityLocation: ->
    if @_facilityLocation.values[0]?
      new CQL_QDM.Facility(@_facilityLocation.values[0])

  ###
  @returns {Interval<Date>}
  ###
  relevantPeriod: ->
    low = @_relevantPeriodLow
    high = @_relevantPeriodHigh
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
