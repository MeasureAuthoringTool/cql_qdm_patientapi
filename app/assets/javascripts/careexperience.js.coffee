###
Based on the QDM 4.2 Documentation - Section 4.1.1
###

@cql_qdm_patientapi ||= {}


###
Data elements that meet this criterion indicate the patient’s care experience,
usually measured with a validated survey tool. The most common tool is the
Consumer Assessment of Healthcare Providers and Systems.
###
class cql_qdm_patientapi.PatientCareExperience
  constructor: (@entry) ->
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Date}
  ####
  startDatetime: -> cql.DateTime.fromDate(moment.utc(@_startDatetime, 'X').toDate())

  ###
  @returns {Date}
  ####
  stopDatetime: -> cql.DateTime.fromDate(moment.utc(@_stopDatetime, 'X').toDate())


###
Data elements that meet this criterion indicate the provider's experience
with availability of resources (e.g., scheduling, equipment, space, and
such consumables as medications). Provider care experience gauges provider
satisfaction with key structures, processes, and outcomes in the healthcare
delivery system.
###
class cql_qdm_patientapi.ProviderCareExperience
  constructor: (@entry) ->
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Date}
  ####
  startDatetime: -> cql.DateTime.fromDate(moment.utc(@_startDatetime, 'X').toDate())

  ###
  @returns {Date}
  ####
  stopDatetime: -> cql.DateTime.fromDate(moment.utc(@_stopDatetime, 'X').toDate())
