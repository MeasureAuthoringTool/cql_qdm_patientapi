###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}


###
Data elements that meet criteria using this datatype should document completion
of the assessment indicated by the QDM category and its corresponding value set.

Timing: The time the assessment is completed; author time.
###
class CQL_QDM.AssessmentPerformed extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_method = @entry.method
    @_negationRationale = @entry.negationReasonv
    @_reason = @entry.reason
    @_result = @entry.result

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    cql.DateTime.fromDate(@_authorDatetime.toDate())

  ###
  @returns {Code}
  ###
  method: ->
    cql.Code(@_method?.code, @_method?.code_system)

  ###
  @returns {Code}
  ###
  negationRationale: ->
    cql.Code(@_negationRationale?.code, @_negationRationale?.code_system)

  ###
  @returns {Code}
  ###
  reason: ->
    cql.Code(@_reason?.code, @_reason?.code_system)

  ###
  @returns {Code}
  ###
  result: ->
    cql.Code(@_result?.code, @_result?.code_system)


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
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_method = @entry.method
    @_negationRationale = @entry.negationReasonv
    @_reason = @entry.reason
    @_result = @entry.result

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    cql.DateTime.fromDate(@_authorDatetime.toDate())

  ###
  @returns {Code}
  ###
  method: ->
    cql.Code(@_method?.code, @_method?.code_system)

  ###
  @returns {Code}
  ###
  negationRationale: ->
    cql.Code(@_negationRationale?.code, @_negationRationale?.code_system)

  ###
  @returns {Code}
  ###
  reason: ->
    cql.Code(@_reason?.code, @_reason?.code_system)
