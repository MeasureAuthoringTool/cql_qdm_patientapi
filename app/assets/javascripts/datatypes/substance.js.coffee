###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}


###
Data elements that meet criteria using this datatype should document that the
substance indicated by the QDM category and its corresponding value set was
actually given to the patient.
###
class CQL_QDM.SubstanceAdministered extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_dosage = @entry.dose
    @_frequency = @entry.administrationTiming
    @_negationRationale = @entry.negationReason
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    if @entry.end_time
      @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    else
      # No end time; high is set to infinity
      @_relevantPeriodHigh = CQL_QDM.Helpers.infinityDateTime()
    @_route = @entry.route
    @_supply = @entry.supply

  ###
  Author date time is only present when this data type has been negated.
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime

  ###
  @returns {Quantity}
  ###
  dosage: ->
    if @_dosage?
      new cql.Quantity({unit: @_dosage['unit'], value: @_dosage['scalar']})
    else
      null

  ###
  @returns {Code}
  ###
  frequency: ->
    if @_frequency?
      new cql.Code(@_frequency.code, @_frequency.code_system, @_frequency.version, @_frequency.title)
    else
      null

  ###
  @returns {Code}
  ###
  negationRationale: ->
    if @_negationRationale?
      new cql.Code(@_negationRationale.code, @_negationRationale.code_system)
    else
      null

  ###
  @returns {Interval<Date>}
  ###
  relevantPeriod: ->
    low = @_relevantPeriodLow
    high = @_relevantPeriodHigh
    if low?
      new cql.Interval(low, high)
    else
      null

  ###
  @returns {Code}
  ###
  route: ->
    if @_route?
      new cql.Code(@_route.code, @_route.code_system)
    else
      null

  ###
  @returns {Quantity}
  ###
  supply: ->
    if @_supply?
      new cql.Quantity({unit: @_supply['unit'], value: @_supply['scalar']})
    else
      null


###
Data elements that meet criteria using this datatype should document a request
for the substance indicated by the QDM category and its corresponding value set.
###
class CQL_QDM.SubstanceOrder extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_dosage = @entry.dose
    @_frequency = @entry.administrationTiming
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
    @_authorDatetime

  ###
  @returns {Quantity}
  ###
  dosage: ->
    if @_dosage?
      new cql.Quantity({unit: @_dosage['unit'], value: @_dosage['scalar']})
    else
      null

  ###
  @returns {Code}
  ###
  frequency: ->
    if @_frequency?
      new cql.Code(@_frequency.code, @_frequency.code_system, @_frequency.version, @_frequency.title)
    else
      null

  ###
  @returns {Code}
  ###
  method: ->
    if @_method?
      new cql.Code(@_method.code, @_method.code_system)
    else
      null

  ###
  @returns {Code}
  ###
  negationRationale: ->
    if @_negationRationale?
      new cql.Code(@_negationRationale.code, @_negationRationale.code_system)
    else
      null

  ###
  @returns {Code}
  ###
  reason: ->
    if @_reason?
      new cql.Code(@_reason.code, @_reason.code_system)
    else
      null

  ###
  @returns {Integer}
  ###
  refills: ->
    if @_refills?
      @_refills['scalar']
    else
      null

  ###
  @returns {Code}
  ###
  route: ->
    if @_route?
      new cql.Code(@_route.code, @_route.code_system)
    else
      null

  ###
  @returns {Quantity}
  ###
  supply: ->
    if @_supply?
      new cql.Quantity({unit: @_supply['unit'], value: @_supply['scalar']})
    else
      null


###
Data elements that meet criteria using this datatype should document a
recommendation for the substance indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.SubstanceRecommended extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_dosage = @entry.dose
    @_frequency = @entry.administrationTiming
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
    @_authorDatetime

  ###
  @returns {Quantity}
  ###
  dosage: ->
    if @_dosage?
      new cql.Quantity({unit: @_dosage['unit'], value: @_dosage['scalar']})
    else
      null

  ###
  @returns {Code}
  ###
  frequency: ->
    if @_frequency?
      new cql.Code(@_frequency.code, @_frequency.code_system, @_frequency.version, @_frequency.title)
    else
      null

  ###
  @returns {Code}
  ###
  method: ->
    if @_method?
      new cql.Code(@_method.code, @_method.code_system)
    else
      null

  ###
  @returns {Code}
  ###
  negationRationale: ->
    if @_negationRationale?
      new cql.Code(@_negationRationale.code, @_negationRationale.code_system)
    else
      null

  ###
  @returns {Code}
  ###
  reason: ->
    if @_reason?
      new cql.Code(@_reason.code, @_reason.code_system)
    else
      null

  ###
  @returns {Integer}
  ###
  refills: ->
    if @_refills?
      @_refills['scalar']
    else
      null

  ###
  @returns {Code}
  ###
  route: ->
    if @_route?
      new cql.Code(@_route.code, @_route.code_system)
    else
      null

  ###
  @returns {Quantity}
  ###
  supply: ->
    if @_supply?
      new cql.Quantity({unit: @_supply['unit'], value: @_supply['scalar']})
    else
      null
