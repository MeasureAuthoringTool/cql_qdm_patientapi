###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}

###
Data elements that meet criteria using this datatype should document a request
for the procedure indicated by the QDM category and its corresponding value set.
###
class CQL_QDM.ProcedureOrder extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_anatomicalApproachSite = @entry.anatomical_approach
    @_anatomicalLocationSite = @entry.anatomicalLocation
    @_authorDatetime = @entry.start_time
    @_method = @entry.method
    @_negationRationale = @entry.negationRationale
    @_ordinality = @entry.ordinality
    @_radiationDuration = @entry.radiation_duration
    @_reason = @entry.reason

  ###
  @returns {Code}
  ###
  anatomicalApproachSite: ->
    cql.Code(@_anatomicalApproachSite.code,
      @_anatomicalApproachSite.code_system)

  ###
  @returns {Code}
  ###
  anatomicalLocationSite: ->
    cql.Code(@_anatomicalLocationSite.code,
      @_anatomicalLocationSite.code_system)

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_authorDatetime, 'X').toDate())

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
  ordinality: ->
    cql.Code(@_ordinality.code, @_ordinality.code_system)

  ###
  @returns {Quantity}
  ###
  radiationDuration: ->
    new Quantity({unit: @_radiationDuration['unit'], value: @_radiationDuration['value']})

  ###
  @returns {Code}
  ###
  reason: ->
    cql.Code(@_reason.code, @_reason.code_system)


###
Data elements that meet criteria using this datatype should document the
completion of the procedure indicated by the QDM category and its corresponding
value set.
###
class CQL_QDM.ProcedurePerformed extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_anatomicalApproachSite = @entry.anatomical_approach
    @_anatomicalLocationSite = @entry.anatomicalLocation
    @_incisionDatetime = @entry.incisionTime
    @_method = @entry.method
    @_negationRationale = @entry.negationRationale
    @_ordinality = @entry.ordinality
    @_radiationDosage = @entry.radiation_dose
    @_radiationDuration = @entry.radiation_duration
    @_reason = @entry.reason
    @_relevantPeriodLow = @entry.start_time
    @_relevantPeriodHigh = @entry.end_time
    @_result = @entry.result
    @_status = @entry.status

  ###
  @returns {Code}
  ###
  anatomicalApproachSite: ->
    cql.Code(@_anatomicalApproachSite.code,
      @_anatomicalApproachSite.code_system)

  ###
  @returns {Code}
  ###
  anatomicalLocationSite: ->
    cql.Code(@_anatomicalLocationSite.code,
      @_anatomicalLocationSite.code_system)

  ###
  @returns {Date}
  ###
  incisionDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_incisionDatetime, 'X').toDate())

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
  ordinality: ->
    cql.Code(@_ordinality.code, @_ordinality.code_system)

  ###
  @returns {Quantity}
  ###
  radiationDosage: ->
    new Quantity({unit: @_radiationDosage['unit'], value: @_radiationDosage['value']})

  ###
  @returns {Quantity}
  ###
  radiationDuration: ->
    new Quantity({unit: @_radiationDuration['unit'], value: @_radiationDuration['value']})

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
  result: ->
    cql.Code(@_result.code, @_result.code_system)

  ###
  @returns {Code}
  ###
  status: ->
    cql.Code(@_status.code, @_status.code_system)


###
Data elements that meet criteria using this datatype should document the
recommendation for the procedure indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.ProcedureRecommended extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_anatomicalApproachSite = @entry.anatomical_approach
    @_anatomicalLocationSite = @entry.anatomicalLocation
    @_method = @entry.method
    @_negationRationale = @entry.negationRationale
    @_ordinality = @entry.ordinality
    @_reason = @entry.reason
    @_authorDatetime = @entry.start_time

  ###
  @returns {Code}
  ###
  anatomicalApproachSite: ->
    cql.Code(@_anatomicalApproachSite.code,
      @_anatomicalApproachSite.code_system)

  ###
  @returns {Code}
  ###
  anatomicalLocationSite: ->
    cql.Code(@_anatomicalLocationSite.code,
      @_anatomicalLocationSite.code_system)

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_authorDatetime, 'X').toDate())

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
  ordinality: ->
    cql.Code(@_ordinality.code, @_ordinality.code_system)

  ###
  @returns {Code}
  ###
  reason: ->
    cql.Code(@_reason.code, @_reason.code_system)
