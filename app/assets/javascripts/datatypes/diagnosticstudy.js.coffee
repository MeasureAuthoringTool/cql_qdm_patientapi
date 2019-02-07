###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}

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
###
class CQL_QDM.DiagnosticStudyOrder extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (entry) ->
    super entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(entry.start_time)
    @_negationRationale = entry.negationReason
    @_reason = entry.reason
    delete entry.end_time

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime

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
Data elements that meet criteria using this datatype should document the
completion of the diagnostic study indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.DiagnosticStudyPerformed extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (entry) ->
    super entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(entry.start_time)
    @_facilityLocation = entry.facility
    @_method = entry.method
    @_negationRationale = entry.negationReason
    @_reason = entry.reason
    if entry.values? && entry.values.length > 0
      @_result = entry.values?[0]
    @_resultDatetime = CQL_QDM.Helpers.convertDateTime(entry.result_date_time)
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(entry.start_time)
    if entry.end_time
      @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(entry.end_time)
    else
      # No end time; high is set to infinity
      @_relevantPeriodHigh = null
    @_status = entry.qdm_status
    @_components = entry.components


  ###
  Author date time is only present when this data type has been negated.
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
  The model_info_file also lists Integer, Decimal, and Ratio.
  Decimal and Integer are covered under Quantity with a nil unit.
  Ratio is not yet supported with CQL although it appears in the QDM model.
  @returns {Code|Quantity}
  ###
  result: ->
    CQL_QDM.Helpers.formatResult(@_result)

  ###
  @returns {Date}
  ###
  resultDatetime: ->
    @_resultDatetime

  ###
  @returns {Code}
  ###
  status: ->
    if @_status?
      new cql.Code(@_status.code, @_status.code_system, null, @_status.title || null)
    else
      null

  ###
  @returns {Array}
  ###
  components: ->
    CQL_QDM.Helpers.components(@_components)


###
Data elements that meet criteria using this datatype should document a
recommendation for a request by a clinician or appropriately licensed care
provider to an appropriate provider or organization to perform the diagnostic
study indicated by the QDM category and its corresponding value set.
###
class CQL_QDM.DiagnosticStudyRecommended extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (entry) ->
    super entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(entry.start_time)
    @_negationRationale = entry.negationReason
    delete entry.end_time

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime

  ###
  @returns {Code}
  ###
  negationRationale: ->
    if @_negationRationale?
      new cql.Code(@_negationRationale.code, @_negationRationale.code_system, null, @_negationRationale.title || null)
    else
      null
