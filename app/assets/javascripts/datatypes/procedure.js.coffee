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
    @_anatomicalLocationSite = @entry.anatomical_location
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_ordinality = @entry.ordinality
    @_reason = @entry.reason

  ###
  @returns {Code}
  ###
  anatomicalApproachSite: ->
    if @_anatomicalApproachSite?
      new cql.Code(@_anatomicalApproachSite.code, @_anatomicalApproachSite.code_system, null, @_anatomicalApproachSite.title)
    else
      null

  ###
  @returns {Code}
  ###
  anatomicalLocationSite: ->
    if @_anatomicalLocationSite?
      new cql.Code(@_anatomicalLocationSite.code, @_anatomicalLocationSite.code_system, null, @_anatomicalLocationSite.title)
    else
      null

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime

  ###
  @returns {Code}
  ###
  method: ->
    if @_method?
      new cql.Code(@_method.code, @_method.code_system, null, @_method.title)
    else
      null

  ###
  @returns {Code}
  ###
  negationRationale: ->
    if @_negationRationale?
      new cql.Code(@_negationRationale.code, @_negationRationale.code_system, null, @_negationRationale.title)
    else
      null

  ###
  @returns {Code}
  ###
  ordinality: ->
    if @_ordinality?
      new cql.Code(@_ordinality.code, @_ordinality.code_system, null, @_ordinality.title)
    else
      null

  ###
  @returns {Code}
  ###
  reason: ->
    if @_reason?
      new cql.Code(@_reason.code, @_reason.code_system, null, @_reason.title)
    else
      null


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
    @_anatomicalLocationSite = @entry.anatomical_location
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_incisionDatetime = CQL_QDM.Helpers.convertDateTime(@entry.incisionTime)
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_ordinality = @entry.ordinality
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
    @_components = @entry.components

  ###
  @returns {Code}
  ###
  anatomicalApproachSite: ->
    if @_anatomicalApproachSite?
      new cql.Code(@_anatomicalApproachSite.code, @_anatomicalApproachSite.code_system, null, @_anatomicalApproachSite.title)
    else
      null

  ###
  @returns {Code}
  ###
  anatomicalLocationSite: ->
    if @_anatomicalLocationSite?
      new cql.Code(@_anatomicalLocationSite.code, @_anatomicalLocationSite.code_system, null, @_anatomicalLocationSite.title)
    else
      null

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
    if @_method?
      new cql.Code(@_method.code, @_method.code_system, null, @_method.title)
    else
      null

  ###
  @returns {Code}
  ###
  negationRationale: ->
    if @_negationRationale?
      new cql.Code(@_negationRationale.code, @_negationRationale.code_system, null, @_negationRationale.title)
    else
      null

  ###
  @returns {Code}
  ###
  ordinality: ->
    if @_ordinality?
      new cql.Code(@_ordinality.code, @_ordinality.code_system, null, @_ordinality.title)
    else
      null

  ###
  @returns {Code}
  ###
  reason: ->
    if @_reason?
      new cql.Code(@_reason.code, @_reason.code_system, null, @_reason.title)
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
  @returns {Code}
  ###
  status: ->
    if @_status?
      new cql.Code(@_status.code, @_status.code_system, null, @_status.title)
    else
      null

  ###
  @returns {Array}
  ###
  components: ->
    CQL_QDM.Helpers.components(@_components)


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
    @_anatomicalLocationSite = @entry.anatomical_location
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_ordinality = @entry.ordinality
    @_reason = @entry.reason
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)

  ###
  @returns {Code}
  ###
  anatomicalApproachSite: ->
    if @_anatomicalApproachSite?
      new cql.Code(@_anatomicalApproachSite.code, @_anatomicalApproachSite.code_system, null, @_anatomicalApproachSite.title)
    else
      null

  ###
  @returns {Code}
  ###
  anatomicalLocationSite: ->
    if @_anatomicalLocationSite?
      new cql.Code(@_anatomicalLocationSite.code, @_anatomicalLocationSite.code_system, null, @_anatomicalLocationSite.title)
    else
      null

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime

  ###
  @returns {Code}
  ###
  method: ->
    if @_method?
      new cql.Code(@_method.code, @_method.code_system, null, @_method.title)
    else
      null

  ###
  @returns {Code}
  ###
  negationRationale: ->
    if @_negationRationale?
      new cql.Code(@_negationRationale.code, @_negationRationale.code_system, null, @_negationRationale.title)
    else
      null

  ###
  @returns {Code}
  ###
  ordinality: ->
    if @_ordinality?
      new cql.Code(@_ordinality.code, @_ordinality.code_system, null, @_ordinality.title)
    else
      null

  ###
  @returns {Code}
  ###
  reason: ->
    if @_reason?
      new cql.Code(@_reason.code, @_reason.code_system, null, @_reason.title)
    else
      null
