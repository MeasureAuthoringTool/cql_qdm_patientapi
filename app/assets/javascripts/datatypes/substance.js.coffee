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
    @_dosage = @entry.dose
    # TODO: why not defined?
    #@_frequency =
    @_negationRationale = @entry.negationReason
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    @_route = @entry.route
    @_supply = @entry.supply

  ###
  @returns {Quantity}
  ###
  dosage: ->
    new Quantity({unit: @_dosage['unit'], value: @_dosage['value']})

  ###
  @returns {Code}
  ###
  negationRationale: ->
    cql.Code(@_negationRationale.code, @_negationRationale.code_system)

  ###
  @returns {Interval<Date>}
  ###
  relevantPeriod: ->
    low = cql.DateTime.fromDate(@_relevantPeriodLow.toDate())
    high = cql.DateTime.fromDate(@_relevantPeriodHigh.toDate())
    new cql.Interval(low, high)

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
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason
    @_refills = @entry.refills
    @_route = @entry.route
    @_supply = @entry.supply

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    cql.DateTime.fromDate(moment(@_authorDatetime, 'X').toDate())

  ###
  @returns {Quantity}
  ###
  dosage: ->
    new Quantity({unit: @_dosage['unit'], value: @_dosage['value']})

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
    @_authorDatetime = @entry.start_time
    @_dosage = @entry.dose
    # TODO: why not implemented?
    #@_frequency =
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason
    @_refills = @entry.refills
    @_route = @entry.route
    @_supply = @entry.supply

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    cql.DateTime.fromDate(moment(@_authorDatetime, 'X').toDate())

  ###
  @returns {Quantity}
  ###
  dosage: ->
    new Quantity({unit: @_dosage['unit'], value: @_dosage['value']})

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
