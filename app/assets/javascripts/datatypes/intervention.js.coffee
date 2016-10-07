###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}


###
Data elements that meet criteria using this datatype should document a request
to perform the intervention indicated by the QDM category and its corresponding
value set.
###
class CQL_QDM.InterventionOrder extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    @_authorDatetime = @entry.start_time

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_authorDatetime, 'X').toDate())

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
completion of the intervention indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.InterventionPerformed extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    @_result = @entry.result
    @_startDatetime = @entry.start_time
    @_status = @entry.status
    @_stopDatetime = @entry.end_time

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
  @returns {Code}
  ###
  result: ->
    cql.Code(@_result.code, @_result.code_system)

  ###
  @returns {Date}
  ###
  startDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_startDatetime, 'X').toDate())

  ###
  @returns {Code}
  ###
  status: ->
    cql.Code(@_status.code, @_status.code_system)

  ###
  @returns {Date}
  ###
  stopDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_stopDatetime, 'X').toDate())


###
Data elements that meet criteria using this datatype should document a
recommendation for the intervention indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.InterventionRecommended extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

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
