###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}


###
Data elements that meet criteria using this datatype should document that the
substance indicated by the QDM category and its corresponding value set was
actually given to the patient.
###
class CQL_QDM.SubstanceAdministered extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_dose = @entry.dose
    #@_frequency =
    @_negationRationale = @entry.negationRationale
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
unexpected or dangerous reaction to the substance (e.g., food, environmental
agent) indicated by the QDM category and its corresponding value set.
###
class CQL_QDM.SubstanceAdverseEvent extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
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
Data elements that meet criteria using this datatype should document an
immunologically mediated reaction that exhibits specificity and recurrence on
re-exposure to the offending substance indicated by the QDM category and
its corresponding value set.
###
class CQL_QDM.SubstanceAllergy extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
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
Data elements that meet criteria using this datatype should document a reaction
in specific patients representing a low threshold to the normal effects of the
substance indicated by the QDM category and its corresponding value set.
###
class CQL_QDM.SubstanceIntolerance extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
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
for the substance indicated by the QDM category and its corresponding value set.
###
class CQL_QDM.SubstanceOrder extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_dose = @entry.dose
    #@_frequency =
    @_method = @entry.method
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    @_refills = @entry.refills
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
  @returns {String}
  ###
  refills: ->
    @_refills

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
Data elements that meet criteria using this datatype should document a
recommendation for the substance indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.SubstanceRecommended extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_dose = @entry.dose
    #@_frequency =
    @_method = @entry.method
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    @_refills = @entry.refills
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
  @returns {String}
  ###
  refills: ->
    @_refills

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
