###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}


###
To meet criteria using this datatype, the communication indicated by the Communication
QDM category is a conveyance of information from one entity (e.g., person, organization,
or device) to another.

Timing:
Relevant Period: The time the communication is sent (start time) to the time the
communication is received (end time)
Author dateTime the time the communication is documented (specifically significant for
negation rationale, i.e., Communication Not Performed)
###
class CQL_QDM.CommunicationPerformed extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_negationRationale = @entry.negationReason
    @_relatedTo = @entry.references
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    if @entry.end_time
      @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    else
      # No end time; high is set to infinity
      @_relevantPeriodHigh = CQL_QDM.Helpers.infinityDateTime()
    @_category = @entry.category
    @_sender = @entry.sender
    @_recipient = @entry.recipient
    @_medium = @entry.medium

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime

  ###
  @returns {Code}
  ###
  negationRationale: ->
    if @_negationRationale?
      new cql.Code(@_negationRationale.code, @_negationRationale.code_system, null, @_negationRationale.title || null)
    else
      null

  ###
  @returns {Array}
  ###
  relatedTo: ->
    CQL_QDM.Helpers.relatedTo(@_relatedTo)

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
  @returns {Code}
  ###
  category: ->
    if @_category?
      new cql.Code(@_category.code, @_category.code_system, null, @_category.title || null)
    else
      null

  ###
  @returns {Code}
  ###
  sender: ->
    if @_sender?
      new cql.Code(@_sender.code, @_sender.code_system, null, @_sender.title || null)
    else
      null

  ###
  @returns {Code}
  ###
  recipient: ->
    if @_recipient?
      new cql.Code(@_recipient.code, @_recipient.code_system, null, @_recipient.title || null)
    else
      null

  ###
  @returns {Code}
  ###
  medium: ->
    if @_medium?
      new cql.Code(@_medium.code, @_medium.code_system, null, @_medium.title || null)
    else
      null
