###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}


###
Data elements that meet criteria using this datatype should document completion
of the assessment indicated by the QDM category and its corresponding value set.

Timing: The time the assessment is completed; author time.
###
class CQL_QDM.AssessmentPerformed extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason
    if @entry.values? && @entry.values.length > 0
      @_result = @entry.values?[0]
    @_relatedTo = @entry.references
    @_components = @entry.components

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
  The model_info_file also lists Integer, Decimal, DateTime, Time, and Ratio.
  Decimal and Integer are covered under Quantity with a nil unit.
  Ratio is not yet supported with CQL although it appears in the QDM model.
  Time and Datetime are covered by Date
  @returns {Code|Quantity|Date}
  ###
  result: ->
    if @_result
      # A PhysicalQuantity with unit UnixTime is a TimeStamp, set in bonnie /lib/measures/patient_builder.rb
      if @_result.units == 'UnixTime'
        CQL_QDM.Helpers.convertDateTime(@_result.scalar)
      else
        CQL_QDM.Helpers.formatResult(@_result)
    else
      null

  ###
  @returns {Array}
  ###
  relatedTo: ->
    CQL_QDM.Helpers.relatedTo(@_relatedTo)

  ###
  @returns {Array}
  ###
  components: ->
    CQL_QDM.Helpers.components(@_components)


###
Data elements that meet this criteria using this datatype should document a
recommendation for a request by a clinician or appropriately licensed care
provider to a patient or an appropriate provider or organization to perform an
assessment indicated by the QDM category and its corresponding value set.
Timing: The time the recommendation is authored (i.e., provided to the patient).

NOTE: Recommendations address the time that the recommendation occurs, a single
point in time. Vendors have expressed concerns that recommendations are not
necessarily captured or managed in a standard manner as part of structured data
capture in clinical workflow; many are documented as part of assessments in
narrative text. Measure developers should address feasibility of clinical
workflow to capture recommendations when evaluating measures.
###
class CQL_QDM.AssessmentRecommended extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_method = @entry.method
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason
    if @entry.values? && @entry.values.length > 0
      @_result = @entry.values?[0]

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
  method: ->
    if @_method?
      new cql.Code(@_method.code, @_method.code_system)
    else
      null
