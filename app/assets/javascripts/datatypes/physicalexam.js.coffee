###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}

###
Data elements that meet criteria using this datatype should document a request
for the physical exam indicated by the QDM category and its corresponding value
set. The datatype is expected to be used to identify orders such as "vital
signs, frequency every x hours,” or "pedal pulse check, frequency every 15
minutes for x hours."
Timing: The time the order is signed; author time.
###
class CQL_QDM.PhysicalExamOrder extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_anatomicalLocationSite = @entry.anatomicalLocation
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason

  ###
  @returns {Code}
  ###
  anatomicalLocationSite: ->
    cql.Code(@_anatomicalLocationSite?.code,
      @_anatomicalLocationSite.code_system)

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    cql.DateTime.fromDate(@_authorDatetime.toDate())

  ###
  @returns {Code}
  ###
  method: ->
    cql.Code(@_method?.code, @_method.code_system)

  ###
  @returns {Code}
  ###
  negationRationale: ->
    cql.Code(@_negationRationale?.code, @_negationRationale.code_system)

  ###
  @returns {Code}
  ###
  reason: ->
    cql.Code(@_reason?.code, @_reason.code_system)


###
Data elements that meet criteria using this datatype should document the
completion of the physical exam indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.PhysicalExamPerformed extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_anatomicalLocationSite = @entry.anatomicalLocation
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    @_result = @entry.result

  ###
  @returns {Code}
  ###
  anatomicalLocationSite: ->
    cql.Code(@_anatomicalLocationSite?.code,
      @_anatomicalLocationSite.code_system)

  ###
  @returns {Code}
  ###
  method: ->
    cql.Code(@_method?.code, @_method.code_system)

  ###
  @returns {Code}
  ###
  negationRationale: ->
    cql.Code(@_negationRationale?.code, @_negationRationale.code_system)

  ###
  @returns {Code}
  ###
  reason: ->
    cql.Code(@_reason?.code, @_reason.code_system)

  ###
  @returns {Interval<Date>}
  ###
  relevantPeriod: ->
    low = cql.DateTime.fromDate(@_relevantPeriodLow.toDate())
    high = cql.DateTime.fromDate(@_relevantPeriodHigh.toDate())
    new cql.Interval(low, high)


###
Data elements that meet criteria using this datatype should document a
recommendation for the physical exam indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.PhysicalExamRecommended extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_anatomicalLocationSite = @entry.anatomicalLocation
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason

  ###
  @returns {Code}
  ###
  anatomicalLocationSite: ->
    cql.Code(@_anatomicalLocationSite?.code,
      @_anatomicalLocationSite.code_system)

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    cql.DateTime.fromDate(@_authorDatetime.toDate())

  ###
  @returns {Code}
  ###
  method: ->
    cql.Code(@_method?.code, @_method.code_system)

  ###
  @returns {Code}
  ###
  negationRationale: ->
    cql.Code(@_negationRationale?.code, @_negationRationale.code_system)

  ###
  @returns {Code}
  ###
  reason: ->
    cql.Code(@_reason?.code, @_reason.code_system)
