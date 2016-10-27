###
@namespace scoping into the CQL_QDM namespace
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
  constructor: (@entry) ->
    super @entry
    @_dosage = @entry.dose
    # TODO: why isn't this done?
  #  @_frequency = @entry.
    @_route = @entry.route
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    @_supply = @entry.supply

  ###
  @returns {Quantity}
  ###
  dosage: ->
    new Quantity({unit: @_dosage['unit'], value: @_dosage['value']})

  ###
  @returns {Code}
  ###
  route: ->
    cql.Code(@_route.code, @_route.code_system)

  ###
  @returns {Interval<Date>}
  ###
  relevantPeriod: ->
    low = cql.DateTime.fromDate(@_relevantPeriodLow.toDate())
    high = cql.DateTime.fromDate(@_relevantPeriodHigh.toDate())
    new cql.Interval(low, high)

  ###
  @returns {Quantity}
  ###
  supply: ->
    new Quantity({unit: @_supply['unit'], value: @_supply['value']})

###
Data elements that meet criteria using this datatype should document that the
medication indicated by the QDM category and its corresponding value set was
actually administered to the patient.
###
class CQL_QDM.MedicationAdministered extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_dosage = @entry.dose
    # TODO: what is this comment about?
  #  @_frequency = @entry.
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason
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
  @returns {Code}
  ###
  reason: ->
    cql.Code(@_reason.code, @_reason.code_system)

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
Data elements that meet criteria using this datatype should document that the
medications indicated by the QDM category and its corresponding value set
should be taken by or given to the patient after being discharged from
an inpatient encounter.
###
class CQL_QDM.MedicationDischarge extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = @entry.start_time
    @_dosage = @entry.dose
    # TODO: why not used?
  #  @_frequency = @entry.
    @_negationRationale = @entry.negationReason
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
  negationRationale: ->
    cql.Code(@_negationRationale.code, @_negationRationale.code_system)

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
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = @entry.start_time
    @_dosage = @entry.dose
    # TODO: why not implemented?
  #  @_frequency = @entry.
    @_negationRationale = @entry.negationReason
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
  negationRationale: ->
    cql.Code(@_negationRationale.code, @_negationRationale.code_system)

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
Data elements that meet criteria using this datatype should document a request
to a pharmacy to provide the medication indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.MedicationOrder extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_activeDatetime = @entry.active_datetime
    @_authorDatetime = @entry.start_time
    @_dosage = @entry.dose
    # TODO: why not implemented?
  #  @_frequency = @entry.
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason
    @_refills = @entry.refills
    @_route = @entry.route
    @_supply = @entry.supply

  ###
  @returns {Date}
  ###
  activeDatetime: ->
    cql.DateTime.fromDate(moment(@_activeDatetime, 'X').toDate())

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
