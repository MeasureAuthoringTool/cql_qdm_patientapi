###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}

###
Data elements that meet criteria using this datatype should document a request
for the laboratory test indicated by the QDM category and its corresponding
value set.
###
class CQL_QDM.LaboratoryTestOrder extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_status = @entry.qdm_status

  ###
  @returns {Code}
  ###
  method: ->
    if @_method?
      new cql.Code(@_method.code, @_method.code_system)
    else
      null

  ###
  @returns {Code}
  ###
  negationRationale: ->
    if @_negationRationale?
      new cql.Code(@_negationRationale.code, @_negationRationale.code_system)
    else
      null

  ###
  @returns {Code}
  ###
  reason: ->
    if @_reason?
      new cql.Code(@_reason.code, @_reason.code_system)
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
  status: ->
    if @_status?
      new cql.Code(@_status.code, @_status.code_system)
    else
      null


###
Data elements that meet criteria using this datatype should document the
laboratory test indicated by the QDM category and its corresponding value set
was performed.
###
class CQL_QDM.LaboratoryTestPerformed extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason
    @_referenceRangeLow = @entry.referenceRangeLow
    @_referenceRangeHigh = @entry.referenceRangeHigh
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    if @entry.end_time
      @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    else
      # No end time; high is set to infinity
      @_relevantPeriodHigh = CQL_QDM.Helpers.infinityDateTime()
    if @entry.values? && @entry.values.length > 0
      @_result = @entry.values?[0]
    @_resultDatetime = CQL_QDM.Helpers.convertDateTime(@entry.result_date_time)
    @_status = @entry.qdm_status
    @_components = @entry.components

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
    if @_method?
      new cql.Code(@_method.code, @_method.code_system)
    else
      null

  ###
  @returns {Code}
  ###
  negationRationale: ->
    if @_negationRationale?
      new cql.Code(@_negationRationale.code, @_negationRationale.code_system)
    else
      null

  ###
  @returns {Code}
  ###
  reason: ->
    if @_reason?
      new cql.Code(@_reason.code, @_reason.code_system)
    else
      null

  ###
  @returns {Interval}
  ###
  referenceRange: ->
    # According to documentation, this is assumed to be a 'Quantity'
    high = null
    low = null
    if @_referenceRangeHigh?['units']?
      high_obj =
        unit:
          @_referenceRangeHigh['units']
        value:
          @_referenceRangeHigh['scalar']
      high = new cql.Quantity(high_obj)
    if @_referenceRangeLow?['units']?
      low_obj =
        unit:
          @_referenceRangeLow['units']
        value:
          @_referenceRangeLow['scalar']
      low = new cql.Quantity(low_obj)
    if low?
      new cql.Interval(low, high)
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
      new cql.Code(@_status.code, @_status.code_system)
    else
      null

  ###
  @returns {Array}
  ###
  components: ->
    # Note, this components differs from the one defined in the helpers
    # in that it has a reference range.
    components = []
    if @_components && @_components.values?
      for value in @_components.values
        if value?
          # Lab test performed uses ResultComponent, which has a range
          components.push new CQL_QDM.ResultComponent(value)
    components


###
Data elements that meet criteria using this datatype should document a
recommendation for the laboratory test indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.LaboratoryTestRecommended extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason
    @_status = @entry.qdm_status

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
      new cql.Code(@_method.code, @_method.code_system)
    else
      null

  ###
  @returns {Code}
  ###
  negationRationale: ->
    if @_negationRationale?
      new cql.Code(@_negationRationale.code, @_negationRationale.code_system)
    else
      null

  ###
  @returns {Code}
  ###
  reason: ->
    if @_reason?
      new cql.Code(@_reason.code, @_reason.code_system)
    else
      null

  ###
  @returns {Code}
  ###
  status: ->
    if @_status?
      new cql.Code(@_status.code, @_status.code_system)
    else
      null
