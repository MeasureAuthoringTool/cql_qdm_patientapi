###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}


###
Data elements that meet criteria using this datatype should document that an
encounter indicated by the QDM category and its corresponding value set is in
progress. Keep in mind that when this datatype is used with timingrelationships,
the criterion is looking for an encounter that was in progress for the time
frame indicated by the timing relationships.
###
class CQL_QDM.EncounterActive extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry

    # TODO this had CQL_QDM.Helpers.convertDateTime calls previously. I believe
    # this was related to the lengthOfStay calculation. Need to confirm how this
    # should be.
    @_relevantPeriodLow = @entry.start_time
    @_relevantPeriodHigh = @entry.end_time
    @_locationPeriodLow = @entry.facility?['start_time']
    @_locationPeriodHigh = @entry.facility?['end_time']
    @_facilityLocation = @entry.facility?['name']
    @_reason = @entry.reason

  ###
  @returns {Interval<Date>}
  ###
  relevantPeriod: ->
    low = cql.DateTime.fromDate(moment.utc(@_relevantPeriodLow, 'X').toDate())
    high = cql.DateTime.fromDate(moment.utc(@_relevantPeriodHigh, 'X').toDate())
    new Interval({low: low, high: high})

  ###
  @returns {Code}
  ###
  facilityLocation: ->
    cql.Code(@_facilityLocation.code, @_facilityLocation.code_system)

  ###
  @returns {Interval<Date>}
  ###
  locationPeriod: ->
    low = cql.DateTime.fromDate(moment.utc(@_locationPeriodLow, 'X').toDate())
    high = cql.DateTime.fromDate(moment.utc(@_locationPeriodHigh, 'X').toDate())
    new Interval({low: low, high: high})

  ###
  @returns {Quantity}
  ###
  lengthOfStay: ->
    new Quantity({unit: 'milliseconds', value: (@_relevantPeriodHigh - @_relevantPeriodLow)})

  ###
  @returns {Code}
  ###
  reason: ->
    cql.Code(@_reason.code, @_reason.code_system)


###
Data elements that meet criteria using this datatype should document that an
order for the encounter indicated by the QDM category and its corresponding
value set has been recommended.
###
class CQL_QDM.EncounterOrder extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_facilityLocation = @entry.facility?['name']
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    @_startDatetime = @entry.admitTime
    @_stopDatetime = @entry.dischargeTime

  ###
  @returns {Code}
  ###
  facilityLocation: ->
    cql.Code(@_facilityLocation.code, @_facilityLocation.code_system)

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
encounter indicated by the QDM category and its corresponding value set has
been completed.
###
class CQL_QDM.EncounterPerformed extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry

    @_admissionSource = @entry.admission_source?['name']
    @_diagnosis = @entry.diagnosis
    @_dischargeDisposition = @entry.dischargeDisposition
    @_locationPeriodLow = @entry.facility?['start_time']
    @_locationPeriodHigh = @entry.facility?['end_time']
    @_facilityLocation = @entry.facility?['name']
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    # TODO this had CQL_QDM.Helpers.convertDateTime calls previously. I believe
    # this was related to the lengthOfStay calculation. Need to confirm how this
    # should be.
    @_relevantPeriodLow = @entry.start_time
    @_relevantPeriodHigh = @entry.end_time
    @_principalDiagnosis = @entry.principalDiagnosis

  ###
  @returns {Code}
  ###
  admissionSource: ->
    cql.Code(@_admissionSource.code, @_admissionSource.code_system)

  ###
  @returns {Code}
  ###
  diagnosis: ->
    cql.Code(@_diagnosis.code, @_diagnosis.code_system)

  ###
  @returns {Code}
  ###
  dischargeDisposition: ->
    cql.Code(@_dischargeDisposition.code, @_dischargeDisposition.code_system)

  ###
  @returns {Code}
  ###
  facilityLocation: ->
    cql.Code(@_facilityLocation.code, @_facilityLocation.code_system)

  ###
  @returns {Quantity}
  ###
  lengthOfStay: ->
    new Quantity({unit: 'milliseconds', value: (@_dischargeDatetime - @_admissionDatetime)})

  ###
  @returns {Interval<Date>}
  ###
  locationPeriod: ->
    low = cql.DateTime.fromDate(moment.utc(@_locationPeriodLow, 'X').toDate())
    high = cql.DateTime.fromDate(moment.utc(@_locationPeriodHigh, 'X').toDate())
    new Interval({low: low, high: high})

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
    low = cql.DateTime.fromDate(moment.utc(@_relevantPeriodLow, 'X').toDate())
    high = cql.DateTime.fromDate(moment.utc(@_relevantPeriodHigh, 'X').toDate())
    new Interval({low: low, high: high})

  ###
  @returns {Code}
  ###
  principalDiagnosis: ->
    cql.Code(@_principalDiagnosis.code, @_principalDiagnosis.code_system)


###
Data elements that meet criteria using this datatype should document that the
encounter indicated by the QDM category and its corresponding value set has been
recommended.
###
class CQL_QDM.EncounterRecommended extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_facilityLocation = @entry.facility?['name']
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    @_startDatetime = @entry.admitTime
    @_stopDatetime = @entry.dischargeTime

  ###
  @returns {Code}
  ###
  facilityLocation: ->
    cql.Code(@_facilityLocation.code, @_facilityLocation.code_system)

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
    low = cql.DateTime.fromDate(moment.utc(@_relevantPeriodLow, 'X').toDate())
    high = cql.DateTime.fromDate(moment.utc(@_relevantPeriodHigh, 'X').toDate())
    new Interval({low: low, high: high})

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
