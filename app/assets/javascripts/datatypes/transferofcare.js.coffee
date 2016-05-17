###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}


###
Data elements that meet criteria using this datatype should document the
setting, indicated by the QDM category and its corresponding value set, from
which a patient is received (e.g., home, acute care hospital, skilled nursing)
to the current location.
###
class CQL_QDM.TransferFrom extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_negationRationale = @entry.negationRationale
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Code}
  ###
  negationRationale: ->
    cql.Code(@_negationRationale.code, @_negationRationale.code_system)

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
setting, indicated by the QDM category and its corresponding value set, to
which a patient is released (e.g., home, acute care hospital, skilled nursing)
from the current location.
###
class CQL_QDM.TransferTo extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_negationRationale = @entry.negationRationale
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Code}
  ###
  negationRationale: ->
    cql.Code(@_negationRationale.code, @_negationRationale.code_system)

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
