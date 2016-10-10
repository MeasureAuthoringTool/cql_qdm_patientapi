###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}

###
Data elements that meet criteria using this datatype should document a request
for the laboratory test indicated by the QDM category and its corresponding
value set.
###
class CQL_QDM.LaboratoryTestOrder extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_method = @entry.method
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    @_authorDatetime = @entry.start_time

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
  reason: ->
    cql.Code(@_reason.code, @_reason.code_system)

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_authorDatetime, 'X').toDate())


###
Data elements that meet criteria using this datatype should document the
laboratory test indicated by the QDM category and its corresponding value set
was performed.
###
class CQL_QDM.LaboratoryTestPerformed extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry

    @_method = @entry.method
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    @_referenceRangeLow = @entry.referenceRangeLow
    @_referenceRangeHigh = @entry.referenceRangeHigh
    @_relevantPeriodLow = @entry.start_time
    @_relevantPeriodHigh = @entry.end_time
    @_result = @entry.result
    @_resultDatetime = @entry.result_date_time
    @_status = @entry.status

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
  reason: ->
    cql.Code(@_reason.code, @_reason.code_system)

  ###
  @returns {Interval}
  ###
  referenceRange: ->
    # according to documentation, this is assumed to be a 'Quantity'
    high = null
    low = null
    if @_referenceRangeHigh?['unit']?
      high = new Quantity({unit: @_referenceRangeHigh['unit'], value: @_referenceRangeHigh['value']})
    if @_referenceRangeLow?['unit']?
      low = new Quantity({unit: @_referenceRangeLow['unit'], value: @_referenceRangeLow['value']})
    new Interval({low: low, high: high})

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
    # TODO: return type in modelinfo is Any. does this need to change?
    cql.Code(@_result.code, @_result.code_system)

  ###
  @returns {Date}
  ###
  resultDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_resultDatetime, 'X').toDate())

  ###
  @returns {Code}
  ###
  status: ->
    cql.Code(@_status.code, @_status.code_system)


###
Data elements that meet criteria using this datatype should document a
recommendation for the laboratory test indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.LaboratoryTestRecommended extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = @entry.start_time
    @_method = @entry.method
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason]

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
  reason: ->
    cql.Code(@_reason.code, @_reason.code_system)
