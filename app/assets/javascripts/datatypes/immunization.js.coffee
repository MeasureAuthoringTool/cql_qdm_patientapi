###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}


###
Data elements that meet criteria using this datatype should document that the
vaccine indicated by the QDM category and its corresponding value set was
actually administered to the patient.
###
class CQL_QDM.ImmunizationAdministered extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
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
    @_authorDatetime

  ###
  @returns {Quantity}
  ###
  dosage: ->
    if @_dosage?
      new cql.Quantity({unit: @_dosage['unit'], value: @_dosage['value']})
    else
      null

  ###
  @returns {Code}
  ###
  negationRationale: ->
    if @_negationRationale?
      new cql.Code(@_negationRationale.code, @_negationRationale.code_system, null, @_negationRationale.title)
    else
      null

  ###
  @returns {Code}
  ###
  reason: ->
    if @_reason?
      new cql.Code(@_reason.code, @_reason.code_system, null, @_reason.title)
    else
      null

  ###
  @returns {Code}
  ###
  route: ->
    if @_route?
      new cql.Code(@_route.code, @_route.code_system, null, @_route.title)
    else
      null

  ###
  @returns {Quantity}
  ###
  supply: ->
    if @_supply?
      new cql.Quantity({unit: @_supply['unit'], value: @_supply['value']})
    else
      null


###
Data elements that meet criteria using this datatype should document a request
for the immunization indicated by the QDM category and its corresponding value
set.
###
class CQL_QDM.ImmunizationOrder extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
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
    @_activeDatetime

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime

  ###
  @returns {Quantity}
  ###
  dosage: ->
    if @_dosage?
      new cql.Quantity({unit: @_dosage['unit'], value: @_dosage['value']})
    else
      null

  ###
  @returns {Code}
  ###
  negationRationale: ->
    if @_negationRationale?
      new cql.Code(@_negationRationale.code, @_negationRationale.code_system, null, @_negationRationale.title)
    else
      null

  ###
  @returns {Code}
  ###
  reason: ->
    if @_reason?
      new cql.Code(@_reason.code, @_reason.code_system, null, @_reason.title)
    else
      null

  ###
  @returns {Code}
  ###
  route: ->
    if @_route?
      new cql.Code(@_route.code, @_route.code_system, null, @_route.title)
    else
      null

  ###
  @returns {Quantity}
  ###
  supply: ->
    if @_supply?
      new cql.Quantity({unit: @_supply['unit'], value: @_supply['value']})
    else
      null
