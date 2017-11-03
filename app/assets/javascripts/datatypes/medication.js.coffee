###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}


###
Data elements that meet criteria using this datatype should document that the
medication indicated by the QDM category and its corresponding value set is
being taken by the patient. Keep in mind that when this datatype is used with
timing relationships, the criterion is looking for a medication being taken for
the time frame indicated by the timing relationships.
###
class CQL_QDM.MedicationActive extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_dosage = @entry.dose
    @_frequency = @entry.frequency
    @_route = @entry.route
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    if @entry.end_time
      @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    else
      # No end time; high is set to infinity
      @_relevantPeriodHigh = CQL_QDM.Helpers.infinityDateTime()
    @_supply = @entry.supply

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
  frequency: ->
  # TODO: Frequency currently not in HDS model.  Can probably add by calculating based off of dose & regimen
  throw new Error('Bonnie does not currently support MedicationActive.frequency')
    if @_frequency?
      new cql.Code(@_frequency.code, @_frequency.code_system)
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
  @returns {Quantity}
  ###
  supply: ->
    if @_supply?
      new cql.Quantity({unit: @_supply['unit'], value: @_supply['value']})
    else
      null


###
Data elements that meet criteria using this datatype should document that the
medication indicated by the QDM category and its corresponding value set was
actually administered to the patient.
###
class CQL_QDM.MedicationAdministered extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_dosage = @entry.dose
    @_frequency = @entry.frequency
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason
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
      new cql.Quantity({unit: @_dosage['unit'], value: @_dosage['value']})
    else
      null

  ###
  @returns {code}
  ###
  frequency: ->
  # TODO: Frequency currently not in HDS model.  Can probably add by calculating based off of dose & regimen
  throw new Error('Bonnie does not currently support MedicationAdministered.frequency')
    if @_frequency?
      new cql.Code(@_frequency.code, @_frequency.code_system)
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
      new cql.Quantity({unit: @_supply['unit'], value: @_supply['value']})
    else
      null


###
Data elements that meet criteria using this datatype should document that the
medications indicated by the QDM category and its corresponding value set
should be taken by or given to the patient after being discharged from
an inpatient encounter.
###
class CQL_QDM.MedicationDischarge extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_dosage = @entry.dose
    @_frequency = @entry.frequency
    @_negationRationale = @entry.negationReason
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
      new cql.Quantity({unit: @_dosage['unit'], value: @_dosage['value']})
    else
      null

  ###
  @returns {Code}
  ###
  frequency: ->
  # TODO: Frequency currently not in HDS model.  Can probably add by calculating based off of dose & regimen
  throw new Error('Bonnie does not currently support MedicationDischarge.frequency')
    if @_frequency?
      new cql.Code(@_frequency.code, @_frequency.code_system)
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
  @returns {Integer}
  ###
  refills: ->
    # TODO: Refills should represent 'The number of refills allowed by the prescription.'
    throw new Error('Bonnie does not currently support MedicationDischarge.refills')

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
      new cql.Quantity({unit: @_supply['unit'], value: @_supply['value']})
    else
      null


###
Data elements that meet criteria using this datatype should document that a
prescription for the medication indicated by the QDM category and its
corresponding value set has been dispensed and provided to the patient or
patient proxy. In the ambulatory setting, medications are primarily taken
directly by patients and not directly observed. Hence, dispensed is the closest
health provider documentation of medication compliance. In settings where
patients attest to taking medications in electronic format (perhaps a Personal
Health Record), patient attestation of “medication taken” may be available.
###
class CQL_QDM.MedicationDispensed extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_dosage = @entry.dose
    @_frequency = @entry.frequency
    @_negationRationale = @entry.negationReason
    @_refills = @entry.refills
    @_route = @entry.route
    @_supply = @entry.supply
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    if @entry.end_time
      @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    else
      # No end time; high is set to infinity
      @_relevantPeriodHigh = CQL_QDM.Helpers.infinityDateTime()

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
  frequency: ->
  # TODO: Frequency currently not in HDS model.  Can probably add by calculating based off of dose & regimen
  throw new Error('Bonnie does not currently support MedicationDispensed.frequency')
    if @_frequency?
      new cql.Code(@_frequency.code, @_frequency.code_system)
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
  @returns {Integer}
  ###
  refills: ->
    # TODO: Refills should represent 'The number of refills allowed by the prescription.'
    throw new Error('Bonnie does not currently support MedicationDispensed.refills')

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
      new cql.Quantity({unit: @_supply['unit'], value: @_supply['value']})
    else
      null


###
Data elements that meet criteria using this datatype should document a request
to a pharmacy to provide the medication indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.MedicationOrder extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_activeDatetime = CQL_QDM.Helpers.convertDateTime(@entry.active_datetime)
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_dosage = @entry.dose
    @_frequency = @entry.frequency
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason
    @_refills = @entry.refills
    @_route = @entry.route
    @_supply = @entry.supply
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    if @entry.end_time
      @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    else
      # No end time; high is set to infinity
      @_relevantPeriodHigh = CQL_QDM.Helpers.infinityDateTime()

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
  frequency: ->
  # TODO: Frequency currently not in HDS model.  Can probably add by calculating based off of dose & regimen
  throw new Error('Bonnie does not currently support MedicationOrder.frequency')
    if @_frequency?
      new cql.Code(@_frequency.code, @_frequency.code_system)
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
    # TODO: Refills should represent 'The number of refills allowed by the prescription.'
    throw new Error('Bonnie does not currently support MedicationOrder.refills')

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
      new cql.Quantity({unit: @_supply['unit'], value: @_supply['value']})
    else
      null
