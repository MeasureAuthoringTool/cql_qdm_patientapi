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
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time
    @_relatedTo = @entry.relatedTo
    @_targetOutcome = @entry.targetOutcome

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
  @returns {Code}
  ###
  relatedTo: ->
    cql.Code(@_relatedTo.code, @_relatedTo.code_system)

  ###
  @returns {Quantity | Code}
  ###
  targetOutcome: ->
    if @_targetOutcome?['unit']?
      cql.Quantity(@_targetOutcome['unit'], @_targetOutcome['value'])
    else
      cql.Code(@_targetOutcome.code, @_targetOutcome.code_system)
