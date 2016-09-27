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
    @_admissionDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_dischargeDatetime = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    @_facilityLocation = @entry.facility?['name']
    @_facilityLocationArrivalDatetime = @entry.facility?['start_time']
    @_facilityLocationDepartureDatetime = @entry.facility?['end_time']
    @_reason = @entry.reason

  ###
  @returns {Date}
  ###
  admissionDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_admissionDatetime, 'X').toDate())

  ###
  @returns {Date}
  ###
  dischargeDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_dischargeDatetime, 'X').toDate())

  ###
  @returns {Code}
  ###
  facilityLocation: ->
    cql.Code(@_facilityLocation.code, @_facilityLocation.code_system)

  ###
  @returns {Date}
  ###
  facilityLocationArrivalDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_facilityLocationArrivalDatetime, 'X').toDate())

  ###
  @returns {Date}
  ###
  facilityLocationDepartureDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_facilityLocationDepartureDatetime, 'X').toDate())

  ###
  @returns {Quantity}
  ###
  lengthOfStay: ->
    new Quantity({unit: 'milliseconds', value: (@_dischargeDatetime - @_admissionDatetime)})

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
    @_admissionDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_dischargeDatetime = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    @_diagnosis = @entry.diagnosis
    @_dischargeStatus = @entry.dischargeDisposition
    @_facilityLocation = @entry.facility?['name']
    @_facilityLocationArrivalDatetime = @entry.facility?['start_time']
    @_facilityLocationDepartureDatetime = @entry.facility?['end_time']
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    @_principalDiagnosis = @entry.principalDiagnosis

  ###
  @returns {Date}
  ###
  admissionDatetime: ->
    cql.DateTime.fromDate(@_admissionDatetime.toDate())

  ###
  @returns {Code}
  ###
  diagnosis: ->
    cql.Code(@_diagnosis.code, @_diagnosis.code_system)

  ###
  @returns {Date}
  ###
  dischargeDatetime: ->
    cql.DateTime.fromDate(@_dischargeDatetime.toDate())

  ###
  @returns {Code}
  ###
  dischargeStatus: ->
    cql.Code(@_dischargeStatus.code, @_dischargeStatus.code_system)

  ###
  @returns {Code}
  ###
  facilityLocation: ->
    cql.Code(@_facilityLocation.code, @_facilityLocation.code_system)

  ###
  @returns {Date}
  ###
  facilityLocationArrivalDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_facilityLocationArrivalDatetime, 'X').toDate())

  ###
  @returns {Date}
  ###
  facilityLocationDepartureDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_facilityLocationDepartureDatetime, 'X').toDate())

  ###
  @returns {Quantity}
  ###
  lengthOfStay: ->
    new Quantity({unit: 'milliseconds', value: (@_dischargeDatetime - @_admissionDatetime)})

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
  @returns {Date}
  ###
  startDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_startDatetime, 'X').toDate())

  ###
  @returns {Date}
  ###
  stopDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_stopDatetime, 'X').toDate())
