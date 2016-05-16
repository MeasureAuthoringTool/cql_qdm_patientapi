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
class CQL_QDM.MedicationActive
  constructor: (@entry) ->
    @_cumulativeMedicationDuration = @entry.cumulativeMedicationDuration
    @_dose = @entry.dose
  #  @_frequency = @entry.
    @_route = @entry.route
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Quantity}
  ###
  cumulativeMedicationDuration: ->
    cql.Quantity(@_cumulativeMedicationDuration['unit'],
      @_cumulativeMedicationDuration['value'])

  ###
  @returns {Quantity}
  ###
  dose: ->
    cql.Quantity(@_dose['unit'], @_dose['value'])

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
Data elements that meet criteria using this datatype should document that the
medication indicated by the QDM category and its corresponding value set was
actually administered to the patient.
###
class CQL_QDM.MedicationAdministered
  constructor: (@entry) ->
    @_cumulativeMedicationDuration = @entry.cumulativeMedicationDuration
    @_dose = @entry.dose
  #  @_frequency = @entry.
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    @_route = @entry.route
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Quantity}
  ###
  cumulativeMedicationDuration: ->
    cql.Quantity(@_cumulativeMedicationDuration['unit'],
      @_cumulativeMedicationDuration['value'])

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
unexpected or dangerous reaction to the medication indicated by the QDM
category and its corresponding value set
###
class CQL_QDM.MedicationAdverseEffects
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
Data elements that meet criteria using this datatype should document an
immunologically mediated reaction that exhibits specificity and recurrence on
re-exposure to the offending medication indicated by the QDM category and
its corresponding value set.
###
class CQL_QDM.MedicationAllergy
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
Data elements that meet criteria using this datatype should document that the
medications indicated by the QDM category and its corresponding value set
should be taken by or given to the patient after being discharged from
an inpatient encounter.
###
class CQL_QDM.MedicationDischarge
  constructor: (@entry) ->
    @_dose = @entry.dose
  #  @_frequency = @entry.
    @_negationRationale = @entry.negationRationale
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
Data elements that meet criteria using this datatype should document that a
prescription for the medication indicated by the QDM category and its
corresponding value set has been dispensed and provided to the patient or
patient proxy. In the ambulatory setting, medications are primarily taken
directly by patients and not directly observed. Hence, dispensed is the closest
health provider documentation of medication compliance. In settings where
patients attest to taking medications in electronic format (perhaps a Personal
Health Record), patient attestation of “medication taken” may be available.
###
class CQL_QDM.MedicationDispensed
  constructor: (@entry) ->
    @_cumulativeMedicationDuration = @entry.cumulativeMedicationDuration
    @_dose = @entry.dose
  #  @_frequency = @entry.
    @_negationRationale = @entry.negationRationale
    @_refills = @entry.refills
    @_route = @entry.route
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Quantity}
  ###
  cumulativeMedicationDuration: ->
    cql.Quantity(@_cumulativeMedicationDuration['unit'],
      @_cumulativeMedicationDuration['value'])

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
Data elements that meet criteria using this datatype should document a reaction
in specific patients representing a low threshold to the normal pharmacological
action of the medication indicated by the QDM category and its corresponding
value set.
###
class CQL_QDM.MedicationIntolerance
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
to a pharmacy to provide the medication indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.MedicationOrder
  constructor: (@entry) ->
    @_activeDatetime = @entry.active_datetime
    @_cumulativeMedicationDuration = @entry.cumulativeMedicationDuration
    @_dose = @entry.dose
  #  @_frequency = @entry.
    @_method = @entry.method
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    @_refills = @entry.refills
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
  cumulativeMedicationDuration: ->
    cql.Quantity(@_cumulativeMedicationDuration['unit'],
      @_cumulativeMedicationDuration['value'])

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
