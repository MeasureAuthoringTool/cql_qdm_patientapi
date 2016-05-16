###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}


###
Data elements that meet criteria using this datatype should document an
unexpected or dangerous reaction to a device indicated by the QDM category
and its corresponding value set.
###
class CQL_QDM.DeviceAdverseEvent
  constructor: (@entry) ->
    @_reaction = @entry.reaction
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Code}
  ###
  reaction: ->
    cql.Code(@_reaction.code, @_reaction.code_system)
  
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
Data elements that meet criteria using this datatype should document an
immunologically mediated reaction that exhibits specificity and recurrence
on re-exposure to the offending device indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.DeviceAllergy
  constructor: (@entry) ->
    @_reaction = @entry.reaction
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Code}
  ###
  reaction: ->
    cql.Code(@_reaction.code, @_reaction.code_system)
  
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
Data elements that meet criteria using this datatype should document that the
device indicated by the QDM category and its corresponding value set is in use,
or impacts or alters the treatment, care plan, or encounter (e.g., an
antithrombotic device has been placed on the patient's legs to prevent
thromboembolism, or a cardiac pacemaker is in place).
###
class CQL_QDM.DeviceApplied
  constructor: (@entry) ->
    @_anatomicalApproachSite = @entry.anatomical_approach
    @_anatomicalLocationSite = @entry.anatomical_location
    @_negationRationale = @entry.negationRationale
    @_reason = @entry.reason
    @_removalDatetime = @entry.removal_time
    @_startDatetime = @entry.start_time

  ###
  @returns {Code}
  ###
  anatomicalApproachSite: ->
    cql.Code(@_anatomicalApproachSite.code, @_anatomicalApproachSite.code_system)

  ###
  @returns {Code}
  ###
  anatomicalLocationSite: ->
    cql.Code(@_anatomicalLocationSite.code, @_anatomicalLocationSite.code_system)

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
  removalDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_removalDatetime, 'X').toDate())

  ###
  @returns {Date}
  ###
  startDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_startDatetime, 'X').toDate())


###
Data elements that meet criteria using this datatype should document a reaction
in specific patients who have a low threshold to the normal reported or
expected reactions of the device indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.DeviceIntolerance
  constructor: (@entry) ->
    @_reaction = @entry.reaction
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Code}
  ###
  reaction: ->
    cql.Code(@_reaction.code, @_reaction.code_system)
  
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
Data elements that meet criteria using this datatype should document an order
for the device indicated by the QDM category and its corresponding value set.
###
class CQL_QDM.DeviceOrder
  constructor: (@entry) ->
    @_negationRationale = @entry.negationRationale
    @_reaction = @entry.reaction
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Code}
  ###
  negationRationale: ->
    cql.Code(@_negationRationale.code, @_negationRationale.code_system)

  ###
  @returns {Code}
  ###
  reaction: ->
    cql.Code(@_reaction.code, @_reaction.code_system)
  
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
Data elements that meet criteria using this datatype should document a
recommendation to use the device indicated by the QDM category and its
corresponding value set.
###
class CQL_QDM.DeviceRecommended
  constructor: (@entry) ->
    @_negationRationale = @entry.negationRationale
    @_reaction = @entry.reaction
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Code}
  ###
  negationRationale: ->
    cql.Code(@_negationRationale.code, @_negationRationale.code_system)

  ###
  @returns {Code}
  ###
  reaction: ->
    cql.Code(@_reaction.code, @_reaction.code_system)
  
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
