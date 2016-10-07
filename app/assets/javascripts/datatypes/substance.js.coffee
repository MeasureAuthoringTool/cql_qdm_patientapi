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
    new Quantity({unit: @_dose['unit'], value: @_dose['value']})

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
Data elements that meet criteria using this datatype should document a request
for the substance indicated by the QDM category and its corresponding value set.
###
class CQL_QDM.SubstanceOrder extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = @entry.start_time
    @_dosage = @entry.dose
    # TODO: why not defined?
    #@_frequency =
    @_method = @entry.method
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    @_refills = @entry.refills
    @_route = @entry.route
    @_supply = @entry.supply

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_authorDatetime, 'X').toDate())

  ###
  @returns {Quantity}
  ###
  dosage: ->
    new Quantity({unit: @_dose['unit'], value: @_dose['value']})

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
  @returns {Quantity}
  ###
  supply: ->
    new Quantity({unit: @_supply['unit'], value: @_supply['value']})


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
    new Quantity({unit: @_dose['unit'], value: @_dose['value']})

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
