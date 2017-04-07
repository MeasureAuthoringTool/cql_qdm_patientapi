###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}

###
Data elements that meet criteria using this datatype should document a request
for the physical exam indicated by the QDM category and its corresponding value
set. The datatype is expected to be used to identify orders such as "vital
signs, frequency every x hours,” or "pedal pulse check, frequency every 15
minutes for x hours."
Timing: The time the order is signed; author time.
###
class CQL_QDM.PhysicalExamOrder extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_anatomicalLocationSite = @entry.anatomicalLocation
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason

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
  reason: ->
    new cql.Code(@_reason?.code, @_reason?.code_system)


###
Data elements that meet criteria using this datatype should document the
completion of the physical exam indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.PhysicalExamPerformed extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_anatomicalLocationSite = @entry.anatomicalLocation
    @_authorDatetime = if @entry.negationReason then CQL_QDM.Helpers.convertDateTime(@entry.start_time) else null
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    if @entry.end_time
      @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    else
      # No end time; high is set to infinity
      @_relevantPeriodHigh = CQL_QDM.Helpers.infinityDateTime()
    if @entry.values? && @entry.values.length > 0
      @_result = @entry.values?[0]

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
  @returns {Code|Int}
  ###
  result: ->
    if @_result
      if @_result.codes?
        code_system = @_result.codes[Object.keys(@_result.codes)[0]]
        code = @_result.codes[code_system]
        new cql.Code(code, code_system)
      else
        parseInt(@_result.scalar)


###
Data elements that meet criteria using this datatype should document a
recommendation for the physical exam indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.PhysicalExamRecommended extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_anatomicalLocationSite = @entry.anatomicalLocation
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason

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
  reason: ->
    new cql.Code(@_reason?.code, @_reason?.code_system)
