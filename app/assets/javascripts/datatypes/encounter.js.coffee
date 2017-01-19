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
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    if @entry.end_time
      @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    else
      # No end time; high is set to infinity
      @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime('12/31/9999 12:59 PM')
    @_locationPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.facility?['start_time'])
    @_locationPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.facility?['end_time'])
    @_facilityLocation = @entry.facility?['name']
    @_reason = @entry.reason

  ###
  @returns {Interval<Date>}
  ###
  relevantPeriod: ->
    low = cql.DateTime.fromDate(@_relevantPeriodLow)
    high = cql.DateTime.fromDate(@_relevantPeriodHigh)
    new cql.Interval(low, high)

  ###
  @returns {Code}
  ###
  facilityLocation: ->
    new cql.Code(@_facilityLocation?.code, @_facilityLocation?.code_system)

  ###
  @returns {Interval<Date>}
  ###
  locationPeriod: ->
    low = cql.DateTime.fromDate(@_locationPeriodLow?)
    high = cql.DateTime.fromDate(@_locationPeriodHigh?)
    new cql.Interval(low, high)

  ###
  @returns {Quantity}
  ###
  lengthOfStay: ->
    new Quantity({unit: 'milliseconds', value: (@_relevantPeriodHigh - @_relevantPeriodLow)})

  ###
  @returns {Code}
  ###
  reason: ->
    new cql.Code(@_reason?.code, @_reason?.code_system)


###
Data elements that meet criteria using this datatype should document that an
order for the encounter indicated by the QDM category and its corresponding
value set has been recommended.
###
class CQL_QDM.EncounterOrder extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_facilityLocation = @entry.facility?['name']
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    cql.DateTime.fromDate(@_authorDatetime)

  ###
  @returns {Code}
  ###
  facilityLocation: ->
    new cql.Code(@_facilityLocation?.code, @_facilityLocation?.code_system)

  ###
  @returns {Code}
  ###
  negationRationale: ->
    new cql.Code(@_negationRationale?.code, @_negationRationale?.code_system)

  ###
  @returns {Code}
  ###
  reason: ->
    new cql.Code(@_reason?.code, @_reason?.code_system)


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
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    if @entry.end_time
      @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    else
      # No end time; high is set to infinity
      @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime('12/31/9999 12:59 PM')
    @_principalDiagnosis = @entry.principalDiagnosis

  ###
  @returns {Code}
  ###
  admissionSource: ->
    new cql.Code(@_admissionSource?.code, @_admissionSource?.code_system)

  ###
  @returns {Code}
  ###
  diagnosis: ->
    new cql.Code(@_diagnosis?.code, @_diagnosis?.code_system)

  ###
  @returns {Code}
  ###
  dischargeDisposition: ->
    new cql.Code(@_dischargeDisposition?.code, @_dischargeDisposition?.code_system)

  ###
  @returns {Code}
  ###
  facilityLocation: ->
    new cql.Code(@_facilityLocation?.code, @_facilityLocation?.code_system)

  ###
  @returns {Quantity}
  ###
  lengthOfStay: ->
    new Quantity({unit: 'milliseconds', value: (@_relevantPeriodHigh - @_relevantPeriodLow)})

  ###
  @returns {Interval<Date>}
  ###
  locationPeriod: ->
    low = cql.DateTime.fromDate(@_locationPeriodLow)
    high = cql.DateTime.fromDate(@_locationPeriodHigh)
    new cql.Interval(low, high)

  ###
  @returns {Code}
  ###
  negationRationale: ->
    new cql.Code(@_negationRationale?.code, @_negationRationale?.code_system)

  ###
  @returns {Code}
  ###
  reason: ->
    new cql.Code(@_reason?.code, @_reason?.code_system)

  ###
  @returns {Interval<Date>}
  ###
  relevantPeriod: ->
    low = cql.DateTime.fromDate(@_relevantPeriodLow)
    high = cql.DateTime.fromDate(@_relevantPeriodHigh)
    new cql.Interval(low, high)

  ###
  @returns {Code}
  ###
  principalDiagnosis: ->
    new cql.Code(@_principalDiagnosis?.code, @_principalDiagnosis?.code_system)


###
Data elements that meet criteria using this datatype should document that the
encounter indicated by the QDM category and its corresponding value set has been
recommended.
###
class CQL_QDM.EncounterRecommended extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_facilityLocation = @entry.facility?['name']
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    cql.DateTime.fromDate(@_authorDatetime)

  ###
  @returns {Code}
  ###
  facilityLocation: ->
    new cql.Code(@_facilityLocation?.code, @_facilityLocation?.code_system)

  ###
  @returns {Code}
  ###
  negationRationale: ->
    new cql.Code(@_negationRationale?.code, @_negationRationale?.code_system)

  ###
  @returns {Code}
  ###
  reason: ->
    new cql.Code(@_reason?.code, @_reason?.code_system)
