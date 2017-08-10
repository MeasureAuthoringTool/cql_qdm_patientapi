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
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_radiationDosage = @entry.radiation_dose
    @_radiationDuration = @entry.radiation_duration
    @_reason = @entry.reason

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime

  ###
  @returns {Code}
  ###
  method: ->
    new cql.Code(@_method?.code, @_method?.code_system)

  ###
  @returns {Code}
  ###
  negationRationale: ->
    new cql.Code(@_negationRationale?.code, @_negationRationale?.code_system)

  ###
  @returns {Quantity}
  ###
  radiationDosage: ->
    new cql.Quantity({unit: @_radiationDosage['unit'], value: @_radiationDosage['value']})

  ###
  @returns {Quantity}
  ###
  radiationDuration: ->
    new cql.Quantity({unit: @_radiationDuration['unit'], value: @_radiationDuration['value']})

  ###
  @returns {Code}
  ###
  reason: ->
    new cql.Code(@_reason?.code, @_reason?.code_system)


###
Data elements that meet criteria using this datatype should document the
completion of the diagnostic study indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.DiagnosticStudyPerformed extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_facilityLocation = @entry.facility
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_radiationDosage = @entry.radiation_dose
    @_radiationDuration = @entry.radiation_duration
    @_reason = @entry.reason
    if @entry.values? && @entry.values.length > 0
      @_result = @entry.values?[0]
    @_resultDatetime = CQL_QDM.Helpers.convertDateTime(@entry.result_date_time)
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    if @entry.end_time
      @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    else
      # No end time; high is set to infinity
      @_relevantPeriodHigh = CQL_QDM.Helpers.infinityDateTime()
    @_status = @entry.status
    @_components = @entry.components


  ###
  Author date time is only present when this data type has been negated.
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime

  ###
  @returns {Facility}
  ###
  facilityLocation: ->
    if @_facilityLocation.values[0]?
      new Facility(@_facilityLocation.values[0])

  ###
  @returns {Code}
  ###
  method: ->
    new cql.Code(@_method?.code, @_method?.code_system)

  ###
  @returns {Code}
  ###
  negationRationale: ->
    new cql.Code(@_negationRationale?.code, @_negationRationale?.code_system)

  ###
  @returns {Quantity}
  ###
  radiationDosage: ->
    new cql.Quantity({unit: @_radiationDosage['unit'], value: @_radiationDosage['value']})

  ###
  @returns {Quantity}
  ###
  radiationDuration: ->
    new cql.Quantity({unit: @_radiationDuration['unit'], value: @_radiationDuration['value']})

  ###
  @returns {Code}
  ###
  reason: ->
    new cql.Code(@_reason?.code, @_reason?.code_system)

  ###
  @returns {Interval<Date>}
  ###
  relevantPeriod: ->
    low = @_relevantPeriodLow
    high = @_relevantPeriodHigh
    new cql.Interval(low, high)

  ###
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
    new cql.Code(@_status?.code, @_status?.code_system)
    
  ###
  @returns {Array}
  ###
  components: ->
    components = []
    if @_components
      for value in @_components.values
        if value?
          components.push new Component(value)
    components


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
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_radiationDosage = @entry.radiation_dose
    @_radiationDuration = @entry.radiation_duration

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime

  ###
  @returns {Code}
  ###
  method: ->
    new cql.Code(@_method?.code, @_method?.code_system)

  ###
  @returns {Code}
  ###
  negationRationale: ->
    new cql.Code(@_negationRationale?.code, @_negationRationale?.code_system)

  ###
  @returns {Quantity}
  ###
  radiationDosage: ->
    new cql.Quantity({unit: @_radiationDosage['unit'], value: @_radiationDosage['value']})

  ###
  @returns {Quantity}
  ###
  radiationDuration: ->
    new cql.Quantity({unit: @_radiationDuration['unit'], value: @_radiationDuration['value']})
