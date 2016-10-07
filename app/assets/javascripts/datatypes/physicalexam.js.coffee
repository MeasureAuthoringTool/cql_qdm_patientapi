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
    @_method = @entry.method
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    @_authorDatetime = @entry.start_time

  ###
  @returns {Code}
  ###
  anatomicalLocationSite: ->
    cql.Code(@_anatomicalLocationSite.code,
      @_anatomicalLocationSite.code_system)

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_authorDatetime, 'X').toDate())

  ###
  @returns {Code}
  ###
  method: ->
    cql.Code(@_method.code, @_method.code_system)

  ###
  @returns {Code}
  ###
  negationRationale: ->
    cql.Code(@_negationRationale.code, @_negationRationale.code_system)

  ###
  @returns {Code}
  ###
  reason: ->
    cql.Code(@_reason.code, @_reason.code_system)


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
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    @_result = @entry.result
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Code}
  ###
  anatomicalLocationSite: ->
    cql.Code(@_anatomicalLocationSite.code,
      @_anatomicalLocationSite.code_system)

  ###
  @returns {Code}
  ###
  method: ->
    cql.Code(@_method.code, @_method.code_system)

  ###
  @returns {Code}
  ###
  negationRationale: ->
    cql.Code(@_negationRationale.code, @_negationRationale.code_system)

  ###
  @returns {Code}
  ###
  reason: ->
    cql.Code(@_reason.code, @_reason.code_system)

  ###
  @returns {Date}
  ###
  startDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_startDatetime, 'X').toDate())

  ###
  @returns {Date}
  ###
  stopDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_stopDatetime, 'X').toDate())


###
Data elements that meet criteria using this datatype should document a
recommendation for the physical exam indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.PhysicalExamRecommended extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_anatomicalLocationSite = @entry.anatomicalLocation
    @_method = @entry.method
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Code}
  ###
  anatomicalLocationSite: ->
    cql.Code(@_anatomicalLocationSite.code,
      @_anatomicalLocationSite.code_system)

  ###
  @returns {Code}
  ###
  method: ->
    cql.Code(@_method.code, @_method.code_system)

  ###
  @returns {Code}
  ###
  negationRationale: ->
    cql.Code(@_negationRationale.code, @_negationRationale.code_system)

  ###
  @returns {Code}
  ###
  reason: ->
    cql.Code(@_reason.code, @_reason.code_system)

  ###
  @returns {Date}
  ###
  startDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_startDatetime, 'X').toDate())

  ###
  @returns {Date}
  ###
  stopDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_stopDatetime, 'X').toDate())
