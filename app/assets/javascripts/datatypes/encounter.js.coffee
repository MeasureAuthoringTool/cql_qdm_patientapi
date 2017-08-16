###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}

###
Data elements that meet criteria using this datatype should document that an
order for the encounter indicated by the QDM category and its corresponding
value set has been recommended.
###
class CQL_QDM.EncounterOrder extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_facilityLocation = @entry.facility
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime

  ###
  @returns {Facility}
  ###
  facilityLocation: ->
    if @_facilityLocation.values[0]?
      new CQL_QDM.Facility(@_facilityLocation.values[0])

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
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_admissionSource = @entry.admission_source
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_diagnoses = @entry.diagnosis
    @_dischargeDisposition = @entry.dischargeDisposition
    @_facilityLocations = @entry.facility 
    @_negationRationale = @entry.negationReason
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    if @entry.end_time
      @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    else
      # No end time; high is set to infinity
      @_relevantPeriodHigh = CQL_QDM.Helpers.infinityDateTime()
    @_principalDiagnosis = @entry.principalDiagnosis

  ###
  @returns {Code}
  ###
  admissionSource: ->
    new cql.Code(@_admissionSource?.code, @_admissionSource?.code_system)

  ###
  Author date time is only present when this data type has been negated.
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime

  ###
  @returns {Array}
  ###
  diagnoses: ->
    diagnoses = []
    if @_diagnoses
      for diagnosis in @_diagnoses.values
        if diagnosis?
          diagnoses.push new cql.Code(diagnosis.code, diagnosis.code_system)
    diagnoses

  ###
  @returns {Code}
  ###
  dischargeDisposition: ->
    new cql.Code(@_dischargeDisposition?.code, @_dischargeDisposition?.code_system)

  ###
  @returns {Array}
  ###
  facilityLocations: ->
    # For Encounter Performeed, there can be multiple Facility Locations
    facilityLocations = []
    if @_facilityLocations
      for facility in @_facilityLocations.values
        if facility?
          facilityLocations.push new CQL_QDM.Facility(facility)
    facilityLocations

  ###
  @returns {Quantity}
  ###
  lengthOfStay: ->
    new cql.Quantity({unit: 'days', value: @_relevantPeriodLow.differenceBetween(@_relevantPeriodHigh, 'day')?.high})

  ###
  @returns {Code}
  ###
  negationRationale: ->
    new cql.Code(@_negationRationale?.code, @_negationRationale?.code_system)

  ###
  @returns {Interval<Date>}
  ###
  relevantPeriod: ->
    low = @_relevantPeriodLow
    high = @_relevantPeriodHigh
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
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_facilityLocation = @entry.facility
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime

  ###
  @returns {Facility}
  ###
  facilityLocation: ->
    if @_facilityLocation.values[0]?
      new CQL_QDM.Facility(@_facilityLocation.values[0])

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
