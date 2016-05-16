###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}


###
Data elements that meet criteria using this datatype should document that a
request to perform the functional status assessment indicated by the QDM
category and its corresponding value set has been completed.
###
class CQL_QDM.FunctionalStatusOrder
  constructor: (@entry) ->
    @_method = @entry.method
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

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
Data elements that meet criteria using this datatype should document the
completion of the functional status assessment indicated by the QDM category
and its corresponding value set.
###
class CQL_QDM.FunctionalStatusPerformed
  constructor: (@entry) ->
    @_method = @entry.method
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    @_result = @entry.result
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

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
  @returns {Date}
  ###
  stopDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_stopDatetime, 'X').toDate())


###
Data elements that meet criteria using this datatype should document a
recommendation regarding the functional status assessment indicated by
the QDM category and that its corresponding value set has been completed.
###
class CQL_QDM.FunctionalStatusRecommended
  constructor: (@entry) ->
    @_method = @entry.method
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

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
