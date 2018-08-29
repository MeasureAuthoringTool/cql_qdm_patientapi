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
    @_frequency = @entry.administrationTiming
    @_route = @entry.route
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    if @entry.end_time
      @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    else
      # No end time; high is set to infinity
      @_relevantPeriodHigh = CQL_QDM.Helpers.infinityDateTime()

  ###
  @returns {Quantity}
  ###
  dosage: ->
    if @_dosage?
      if @_dosage['unit']? || @_dosage['value']?
        new cql.Quantity({unit: @_dosage['unit'], value: @_dosage['value']})
      else
        new cql.Quantity({unit: @_dosage['units'], value: @_dosage['scalar']})
    else
      null

  ###
  @returns {Code}
  ###
  frequency: ->
    if @_frequency?
      new cql.Code(@_frequency.code, @_frequency.code_system, null, @_frequency.title || null)
    else
      null

  ###
  @returns {Code}
  ###
  route: ->
    if @_route?
      new cql.Code(@_route.code, @_route.code_system, null, @_route.title || null)
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
    @_frequency = @entry.administrationTiming
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    if @entry.end_time
      @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    else
      # No end time; high is set to infinity
      @_relevantPeriodHigh = CQL_QDM.Helpers.infinityDateTime()
    @_route = @entry.route

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
      if @_dosage['unit']? || @_dosage['value']?
        new cql.Quantity({unit: @_dosage['unit'], value: @_dosage['value']})
      else
        new cql.Quantity({unit: @_dosage['units'], value: @_dosage['scalar']})
    else
      null

  ###
  @returns {code}
  ###
  frequency: ->
    if @_frequency?
      new cql.Code(@_frequency.code, @_frequency.code_system, null, @_frequency.title || null)
    else
      null

  ###
  @returns {Code}
  ###
  negationRationale: ->
    if @_negationRationale?
      new cql.Code(@_negationRationale.code, @_negationRationale.code_system, null, @_negationRationale.title || null)
    else
      null

  ###
  @returns {Code}
  ###
  reason: ->
    if @_reason?
      new cql.Code(@_reason.code, @_reason.code_system, null, @_reason.title || null)
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
      new cql.Code(@_route.code, @_route.code_system, null, @_route.title || null)
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
    @_frequency = @entry.administrationTiming
    @_negationRationale = @entry.negationReason
    @_prescriberIdentifier = @entry.prescriberIdentifier
    @_refills = @entry.refills
    @_route = @entry.route
    @_supply = @entry.supply
    delete @entry.end_time

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
      if @_dosage['unit']? || @_dosage['value']?
        new cql.Quantity({unit: @_dosage['unit'], value: @_dosage['value']})
      else
        new cql.Quantity({unit: @_dosage['units'], value: @_dosage['scalar']})
    else
      null

  ###
  @returns {Code}
  ###
  frequency: ->
    if @_frequency?
      new cql.Code(@_frequency.code, @_frequency.code_system, null, @_frequency.title || null)
    else
      null

  ###
  @returns {Code}
  ###
  negationRationale: ->
    if @_negationRationale?
      new cql.Code(@_negationRationale.code, @_negationRationale.code_system, null, @_negationRationale.title || null)
    else
      null

  ###
  @returns {Id}
  ###
  prescriberId: ->
   if @_prescriberIdentifier?
    new CQL_QDM.Id(@_prescriberIdentifier.value, @_prescriberIdentifier.namingSystem)
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
      new cql.Code(@_route.code, @_route.code_system, null, @_route.title || null)
    else
      null

  ###
  @returns {Quantity}
  ###
  supply: ->
    if @_supply?
      new cql.Quantity({unit: @_supply['units'], value: @_supply['scalar']})
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
    @_dispenserIdentifier = @entry.dispenserIdentifier
    @_dosage = @entry.dose
    @_frequency = @entry.administrationTiming
    @_negationRationale = @entry.negationReason
    @_prescriberIdentifier = @entry.prescriberIdentifier
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
  @returns {Id}
  ###
  dispenserId: ->
   if @_prescriberIdentifier?
    new CQL_QDM.Id(@_dispenserIdentifier.value, @_dispenserIdentifier.namingSystem)
   else
    null

  ###
  @returns {Quantity}
  ###
  dosage: ->
    if @_dosage?
      if @_dosage['unit']? || @_dosage['value']?
        new cql.Quantity({unit: @_dosage['unit'], value: @_dosage['value']})
      else
        new cql.Quantity({unit: @_dosage['units'], value: @_dosage['scalar']})
    else
      null

  ###
  @returns {Code}
  ###
  frequency: ->
    if @_frequency?
      new cql.Code(@_frequency.code, @_frequency.code_system, null, @_frequency.title || null)
    else
      null

  ###
  @returns {Code}
  ###
  negationRationale: ->
    if @_negationRationale?
      new cql.Code(@_negationRationale.code, @_negationRationale.code_system, null, @_negationRationale.title || null)
    else
      null

  ###
  @returns {Id}
  ###
  prescriberId: ->
   if @_prescriberIdentifier?
    new CQL_QDM.Id(@_prescriberIdentifier.value, @_prescriberIdentifier.namingSystem)
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
    if @_refills?
      @_refills['scalar']
    else
      null

  ###
  @returns {Code}
  ###
  route: ->
    if @_route?
      new cql.Code(@_route.code, @_route.code_system, null, @_route.title || null)
    else
      null

  ###
  @returns {Quantity}
  ###
  supply: ->
    if @_supply?
      new cql.Quantity({unit: @_supply['units'], value: @_supply['scalar']})
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
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_dosage = @entry.dose
    @_frequency = @entry.administrationTiming
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_prescriberIdentifier = @entry.prescriberIdentifier
    @_reason = @entry.reason
    @_refills = @entry.refills
    @_route = @entry.route
    @_setting = @entry.setting
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
      if @_dosage['unit']? || @_dosage['value']?
        new cql.Quantity({unit: @_dosage['unit'], value: @_dosage['value']})
      else
        new cql.Quantity({unit: @_dosage['units'], value: @_dosage['scalar']})
    else
      null

  ###
  @returns {Code}
  ###
  frequency: ->
    if @_frequency?
      new cql.Code(@_frequency.code, @_frequency.code_system, null, @_frequency.title || null)
    else
      null

  ###
  @returns {Code}
  ###
  method: ->
    if @_method?
      new cql.Code(@_method.code, @_method.code_system, null, @_method.title || null)
    else
      null

  ###
  @returns {Code}
  ###
  negationRationale: ->
    if @_negationRationale?
      new cql.Code(@_negationRationale.code, @_negationRationale.code_system, null, @_negationRationale.title || null)
    else
      null

  ###
  @returns {Id}
  ###
  prescriberId: ->
   if @_prescriberIdentifier?
    new CQL_QDM.Id(@_prescriberIdentifier.value, @_prescriberIdentifier.namingSystem)
   else
    null

  ###
  @returns {Code}
  ###
  reason: ->
    if @_reason?
      new cql.Code(@_reason.code, @_reason.code_system, null, @_reason.title || null)
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
      new cql.Code(@_route.code, @_route.code_system, null, @_route.title || null)
    else
      null

  ###
  @returns {Code}
  ###
  setting: ->
    if @_setting?
      new cql.Code(@_setting.code, @_setting.code_system, null, @_setting.title || null)
    else
      null

  ###
  @returns {Quantity}
  ###
  supply: ->
    if @_supply?
      new cql.Quantity({unit: @_supply['units'], value: @_supply['scalar']})
    else
      null
