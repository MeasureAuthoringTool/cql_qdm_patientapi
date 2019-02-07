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
  constructor: (entry) ->
    super entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(entry.start_time)
    @_facilityLocation = entry.facility
    @_negationRationale = entry.negationReason
    @_reason = entry.reason
    delete entry.end_time

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime

  ###
  @returns {FacilityLocation}
  ###
  facilityLocation: ->
    if @_facilityLocation?.values?[0]?
      new CQL_QDM.FacilityLocation(@_facilityLocation.values[0])
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
Data elements that meet criteria using this datatype should document that the
encounter indicated by the QDM category and its corresponding value set has
been completed.
###
class CQL_QDM.EncounterPerformed extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (entry) ->
    super entry
    @_admissionSource = entry.admission_source
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(entry.start_time)
    @_diagnoses = entry.diagnosis
    @_dischargeDisposition = entry.dischargeDisposition
    @_facilityLocations = entry.facility
    @_negationRationale = entry.negationReason
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(entry.start_time)
    if entry.end_time
      @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(entry.end_time)
    else
      @_relevantPeriodHigh = null
    @_principalDiagnosis = entry.principalDiagnosis

  ###
  @returns {Code}
  ###
  admissionSource: ->
    if @_admissionSource?
      new cql.Code(@_admissionSource.code, @_admissionSource.code_system, null, @_admissionSource.title || null)
    else
      null

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
    CQL_QDM.Helpers.diagnoses(@_diagnoses, @_principalDiagnosis)

  ###
  @returns {Code}
  ###
  dischargeDisposition: ->
    if @_dischargeDisposition?
      new cql.Code(@_dischargeDisposition.code, @_dischargeDisposition.code_system, null, @_dischargeDisposition.title || null)
    else
      null

  ###
  @returns {Array}
  ###
  facilityLocations: ->
    # For Encounter Performed, there can be multiple Facility Locations
    facilityLocations = []
    if @_facilityLocations? && @_facilityLocations.values?
      for facility in @_facilityLocations.values
        if facility?
          facilityLocations.push new CQL_QDM.FacilityLocation(facility)
    facilityLocations

  ###
  @returns {Quantity}
  ###
  lengthOfStay: ->
    low = @_relevantPeriodLow
    high = @_relevantPeriodHigh
    if low?
      new cql.Quantity({unit: 'days', value: low.differenceBetween(high, 'day')?.high})
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
  principalDiagnosis: ->
    if @_principalDiagnosis?
      new cql.Code(@_principalDiagnosis.code, @_principalDiagnosis.code_system, null, @_principalDiagnosis.title || null)
    else
      null


###
Data elements that meet criteria using this datatype should document that the
encounter indicated by the QDM category and its corresponding value set has been
recommended.
###
class CQL_QDM.EncounterRecommended extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (entry) ->
    super entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(entry.start_time)
    @_facilityLocation = entry.facility
    @_negationRationale = entry.negationReason
    @_reason = entry.reason
    delete entry.end_time

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime

  ###
  @returns {FacilityLocation}
  ###
  facilityLocation: ->
    if @_facilityLocation?.values?[0]?
      new CQL_QDM.FacilityLocation(@_facilityLocation.values[0])
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
