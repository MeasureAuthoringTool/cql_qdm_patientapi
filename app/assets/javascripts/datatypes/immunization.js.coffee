###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}


###
Data elements that meet criteria using this datatype should document that the
vaccine indicated by the QDM category and its corresponding value set was
actually administered to the patient.
###
class CQL_QDM.ImmunizationAdministered
  constructor: (@entry) ->
    @_dose = @entry.dose
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    @_route = @entry.route
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Quantity}
  ###
  dose: ->
    cql.Quantity(@_dose['unit'], @_dose['value'])

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
  route: ->
    cql.Code(@_route.code, @_route.code_system)

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
Data elements that meet criteria using this datatype should document an
immunologically mediated reaction that exhibits specificity and recurrence
on re-exposure to the offending vaccine indicated by the QDM category and
its corresponding value set.
###
class CQL_QDM.ImmunizationAllergy
  constructor: (@entry) ->
    @_reaction = @entry.reaction
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Code}
  ###
  reaction: ->
    cql.Code(@_reaction.code, @_reaction.code_system)

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
reaction in specific patients representing a low threshold to the normal
pharmacological action of the vaccine indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.ImmunizationIntolerance
  constructor: (@entry) ->
    @_reaction = @entry.reaction
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Code}
  ###
  reaction: ->
    cql.Code(@_reaction.code, @_reaction.code_system)

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
Data elements that meet criteria using this datatype should document a request
for the immunization indicated by the QDM category and its corresponding value
set.
###
class CQL_QDM.ImmunizationOrder
  constructor: (@entry) ->
    @_activeDatetime = @entry.active_datetime
    @_dose = @entry.dose
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    @_route = @entry.route
    @_signedDatetime = @entry.signed_datetime
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Date}
  ###
  activeDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_activeDatetime, 'X').toDate())

  ###
  @returns {Quantity}
  ###
  dose: ->
    cql.Quantity(@_dose['unit'], @_dose['value'])

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
  route: ->
    cql.Code(@_route.code, @_route.code_system)

  ###
  @returns {Date}
  ###
  signedDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_signedDatetime, 'X').toDate())

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
