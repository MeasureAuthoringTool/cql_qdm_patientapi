###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}


###
Data elements that meet criteria using this datatype should document an
unexpected or dangerous reaction to the diagnostic study indicated by the QDM
category and its corresponding value set.
###
class CQL_QDM.DiagnosticStudyAdverseEvent
  constructor: (@entry) ->
    @_radiationDosage = @entry.radiation_dose
    @_radiationDuration = @entry.radiation_duration
    @_reaction = @entry.reaction
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Quantity}
  ###
  radiationDosage: ->
    cql.Quantity(@_radiationDosage['unit'], @_radiationDosage['value'])

  ###
  @returns {Quantity}
  ###
  radiationDuration: ->
    cql.Quantity(@_radiationDuration['unit'], @_radiationDuration['value'])

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
in specific patients who have a low threshold to the normal reported or
expected reactions of the diagnostic study indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.DiagnosticStudyIntolerance
  constructor: (@entry) ->
    @_radiationDosage = @entry.radiation_dose
    @_radiationDuration = @entry.radiation_duration
    @_reaction = @entry.reaction
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Quantity}
  ###
  radiationDosage: ->
    cql.Quantity(@_radiationDosage['unit'], @_radiationDosage['value'])

  ###
  @returns {Quantity}
  ###
  radiationDuration: ->
    cql.Quantity(@_radiationDuration['unit'], @_radiationDuration['value'])

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
by a clinician or appropriately licensed care provider to an appropriate
provider or organization to perform the diagnostic study indicated by the QDM
category and its corresponding value set. The request may be in the form of a
consultation or a direct order to the organization that performs the diagnostic
study. Diagnostic studies are those that are not performed in the clinical
laboratory. Such studies include but are not limited to imaging studies,
cardiology studies (electrocardiogram, treadmill stress testing), pulmonary
function testing, vascular laboratory testing, and others.

The start and stop datetime of Medication, Order reflects the
“author time” of the record in QRDA. This corresponds to when the order was
signed.
###
class CQL_QDM.DiagnosticStudyOrder
  constructor: (@entry) ->
    @_method = @entry.method
    @_negationRationale = @entry.negationRationale
    @_radiationDosage = @entry.radiation_dose
    @_radiationDuration = @entry.radiation_duration
    @_reason = @entry.reason
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

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
  @returns {Quantity}
  ###
  radiationDosage: ->
    cql.Quantity(@_radiationDosage['unit'], @_radiationDosage['value'])

  ###
  @returns {Quantity}
  ###
  radiationDuration: ->
    cql.Quantity(@_radiationDuration['unit'], @_radiationDuration['value'])

  ###
  @returns {Code}
  ###
  reason: ->
    cql.Code(@_reason.code, @_reason.code_system)

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
Data elements that meet criteria using this datatype should document the
completion of the diagnostic study indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.DiagnosticStudyPerformed
  constructor: (@entry) ->
    @_facilityLocation = @entry.facility_location
    @_method = @entry.method
    @_negationRationale = @entry.negationRationale
    @_radiationDosage = @entry.radiation_dose
    @_radiationDuration = @entry.radiation_duration
    @_reason = @entry.reason
    @_result = @entry.result
    @_startDatetime = @entry.start_time
    @_status = @entry.status
    @_stopDatetime = @entry.end_time

  ###
  @returns {Code}
  ###
  facilityLocation: ->
    cql.Code(@_facilityLocation.code, @_facilityLocation.code_system)

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
  @returns {Quantity}
  ###
  radiationDosage: ->
    cql.Quantity(@_radiationDosage['unit'], @_radiationDosage['value'])

  ###
  @returns {Quantity}
  ###
  radiationDuration: ->
    cql.Quantity(@_radiationDuration['unit'], @_radiationDuration['value'])

  ###
  @returns {Code}
  ###
  reason: ->
    cql.Code(@_reason.code, @_reason.code_system)

  ###
  @returns {Code}
  ###
  result: ->
    cql.Code(@_result.code, @_result.code_system)

  ###
  @returns {Date}
  ###
  startDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_startDatetime, 'X').toDate())

  ###
  @returns {Code}
  ###
  status: ->
    cql.Code(@_status.code, @_status.code_system)

  ###
  @returns {Date}
  ###
  stopDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_stopDatetime, 'X').toDate())


###
Data elements that meet criteria using this datatype should document a
recommendation for a request by a clinician or appropriately licensed care
provider to an appropriate provider or organization to perform the diagnostic
study indicated by the QDM category and its corresponding value set.
###
class CQL_QDM.DiagnosticStudyRecommended
  constructor: (@entry) ->
    @_method = @entry.method
    @_negationRationale = @entry.negationRationale
    @_radiationDosage = @entry.radiation_dose
    @_radiationDuration = @entry.radiation_duration
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

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
  @returns {Quantity}
  ###
  radiationDosage: ->
    cql.Quantity(@_radiationDosage['unit'], @_radiationDosage['value'])

  ###
  @returns {Quantity}
  ###
  radiationDuration: ->
    cql.Quantity(@_radiationDuration['unit'], @_radiationDuration['value'])

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
