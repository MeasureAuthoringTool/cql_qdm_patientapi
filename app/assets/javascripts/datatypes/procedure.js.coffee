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
    @_method = @entry.method
    @_negationRationale = @entry.negationRationale
    @_ordinality = @entry.ordinality
    @_radiationDuration = @entry.radiation_duration
    @_reason = @entry.reason
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

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
  radiationDuration: ->
    cql.Code(@_radiationDuration.code, @_radiationDuration.code_system)

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
    @_result = @entry.result
    @_startDatetime = @entry.start_time
    @_status = @entry.status
    @_stopDatetime = @entry.end_time

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
  @returns {Code}
  ###
  radiationDosage: ->
    cql.Code(@_radiationDosage.code, @_radiationDosage.code_system)

  ###
  @returns {Code}
  ###
  radiationDuration: ->
    cql.Code(@_radiationDuration.code, @_radiationDuration.code_system)

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
