###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}


###
Data elements that meet criteria using this datatype should document that the
vaccine indicated by the QDM category and its corresponding value set was
actually administered to the patient.
###
class CQL_QDM.ImmunizationAdministered extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_dosage = @entry.dose
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason
    @_route = @entry.route
    @_supply = @entry.supply

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    cql.DateTime.fromDate(@_authorDatetime.toDate())

  ###
  @returns {Quantity}
  ###
  dosage: ->
    new Quantity({unit: @_dosage['unit'], value: @_dosage['value']})

  ###
  @returns {Code}
  ###
  negationRationale: ->
    cql.Code(@_negationRationale?.code, @_negationRationale?.code_system)

  ###
  @returns {Code}
  ###
  reason: ->
    cql.Code(@_reason?.code, @_reason?.code_system)

  ###
  @returns {Code}
  ###
  route: ->
    cql.Code(@_route?.code, @_route?.code_system)

  ###
  @returns {Quantity}
  ###
  supply: ->
    new Quantity({unit: @_supply['unit'], value: @_supply['value']})

###
Data elements that meet criteria using this datatype should document a request
for the immunization indicated by the QDM category and its corresponding value
set.
###
class CQL_QDM.ImmunizationOrder extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_activeDatetime = CQL_QDM.Helpers.convertDateTime(@entry.active_datetime)
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_dosage = @entry.dose
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason
    @_route = @entry.route
    @_supply = @entry.supply

  ###
  @returns {Date}
  ###
  activeDatetime: ->
    cql.DateTime.fromDate(@_activeDatetime.toDate())

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    cql.DateTime.fromDate(@_authorDatetime.toDate())

  ###
  @returns {Quantity}
  ###
  dosage: ->
    new Quantity({unit: @_dosage['unit'], value: @_dosage['value']})

  ###
  @returns {Code}
  ###
  negationRationale: ->
    cql.Code(@_negationRationale?.code, @_negationRationale?.code_system)

  ###
  @returns {Code}
  ###
  reason: ->
    cql.Code(@_reason?.code, @_reason?.code_system)

  ###
  @returns {Code}
  ###
  route: ->
    cql.Code(@_route?.code, @_route?.code_system)

  ###
  @returns {Quantity}
  ###
  supply: ->
    new Quantity({unit: @_supply['unit'], value: @_supply['value']})
