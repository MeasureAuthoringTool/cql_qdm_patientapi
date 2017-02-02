###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}

###
Data elements that meet criteria using this datatype should document that the
device indicated by the QDM category and its corresponding value set is in use,
or impacts or alters the treatment, care plan, or encounter (e.g., an
antithrombotic device has been placed on the patient's legs to prevent
thromboembolism, or a cardiac pacemaker is in place).
###
class CQL_QDM.DeviceApplied extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_anatomicalApproachSite = @entry.anatomical_approach
    @_anatomicalLocationSite = @entry.anatomical_location
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason
    @_relevantPeriodLow = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    if @entry.end_time
      @_relevantPeriodHigh = CQL_QDM.Helpers.convertDateTime(@entry.end_time)
    else
      # No end time; high is set to infinity
      @_relevantPeriodHigh = CQL_QDM.Helpers.infinityDateTime()

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
Data elements that meet criteria using this datatype should document an order
for the device indicated by the QDM category and its corresponding value set.
###
class CQL_QDM.DeviceOrder extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_negationRationale = @entry.negationReason
    @_reaction = @entry.reaction
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)

  ###
  @returns {Code}
  ###
  negationRationale: ->
    new cql.Code(@_negationRationale?.code, @_negationRationale?.code_system)

  ###
  @returns {Code}
  ###
  reaction: ->
    new cql.Code(@_reaction?.code, @_reaction?.code_system)

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime


###
Data elements that meet criteria using this datatype should document a
recommendation to use the device indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.DeviceRecommended extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_negationRationale = @entry.negationReason
    @_reason = @entry.reason

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime

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
