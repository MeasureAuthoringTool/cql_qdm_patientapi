###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}

###
Data elements that meet criteria using this datatype should document a request
for the procedure indicated by the QDM category and its corresponding value set.
###
class CQL_QDM.ProcedureOrder extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_anatomicalApproachSite = @entry.anatomical_approach
    @_anatomicalLocationSite = @entry.anatomicalLocation
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_ordinality = @entry.ordinality
    @_radiationDuration = @entry.radiation_duration
    @_reason = @entry.reason

  ###
  @returns {Code}
  ###
  anatomicalApproachSite: ->
    new cql.Code(@_anatomicalApproachSite?.code, @_anatomicalApproachSite?.code_system)

  ###
  @returns {Code}
  ###
  anatomicalLocationSite: ->
    new cql.Code(@_anatomicalLocationSite?.code, @_anatomicalLocationSite?.code_system)

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
  @returns {Code}
  ###
  ordinality: ->
    new cql.Code(@_ordinality?.code, @_ordinality?.code_system)

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
completion of the procedure indicated by the QDM category and its corresponding
value set.
###
class CQL_QDM.ProcedurePerformed extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_anatomicalApproachSite = @entry.anatomical_approach
    @_anatomicalLocationSite = @entry.anatomicalLocation
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_incisionDatetime = CQL_QDM.Helpers.convertDateTime(@entry.incisionTime)
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_ordinality = @entry.ordinality
    @_radiationDosage = @entry.radiation_dose
    @_radiationDuration = @entry.radiation_duration
    @_reason = @entry.reason
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    if @entry.end_time
      @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    else
      # No end time; high is set to infinity
      @_relevantPeriodHigh = CQL_QDM.Helpers.infinityDateTime()
    if @entry.values? && @entry.values.length > 0
      @_result = @entry.values?[0]
    @_status = @entry.status

  ###
  @returns {Code}
  ###
  anatomicalApproachSite: ->
    new cql.Code(@_anatomicalApproachSite?.code, @_anatomicalApproachSite?.code_system)

  ###
  @returns {Code}
  ###
  anatomicalLocationSite: ->
    new cql.Code(@_anatomicalLocationSite?.code, @_anatomicalLocationSite?.code_system)

  ###
  Author date time is only present when this data type has been negated.
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime

  ###
  @returns {Date}
  ###
  incisionDatetime: ->
    @_incisionDatetime

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
  @returns {Code}
  ###
  ordinality: ->
    new cql.Code(@_ordinality?.code, @_ordinality?.code_system)

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
    if @_result
      if @_result.codes?
        code_system = Object.keys(@_result.codes)[0]
        code = @_result.codes[code_system][0]
        new cql.Code(code, code_system)
      # Check that the scalar portion is a number and the units are a non-zero length string.
      else if !isNaN(parseFloat(@_result.scalar)) && @_result.units.length > 0
        new cql.Quantity({unit: @_result.units, value: @_result.scalar})
    else
      null

  ###
  @returns {Code}
  ###
  status: ->
    new cql.Code(@_status?.code, @_status?.code_system)


###
Data elements that meet criteria using this datatype should document the
recommendation for the procedure indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.ProcedureRecommended extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_anatomicalApproachSite = @entry.anatomical_approach
    @_anatomicalLocationSite = @entry.anatomicalLocation
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_ordinality = @entry.ordinality
    @_reason = @entry.reason
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)

  ###
  @returns {Code}
  ###
  anatomicalApproachSite: ->
    new cql.Code(@_anatomicalApproachSite?.code, @_anatomicalApproachSite?.code_system)

  ###
  @returns {Code}
  ###
  anatomicalLocationSite: ->
    new cql.Code(@_anatomicalLocationSite?.code, @_anatomicalLocationSite?.code_system)

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
  @returns {Code}
  ###
  ordinality: ->
    new cql.Code(@_ordinality?.code, @_ordinality?.code_system)

  ###
  @returns {Code}
  ###
  reason: ->
    new cql.Code(@_reason?.code, @_reason?.code_system)
