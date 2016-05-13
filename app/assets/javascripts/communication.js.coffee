###
Based on the QDM 4.2 Documentation - Section 4.1.3
###


###
To meet criteria using this datatype, the communication indicated by the
Communication QDM category and its corresponding value set must be
communicated from a patient to a provider.
###
class CommunicationFromPatientToProvider
  constructor: (@entry) ->
    @_negationRationale = @entry.negationRationale
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Code}
  ####
  negationRationale: -> cql.Code(@_negationRationale.code, @_negationRationale.code_system)

  ###
  @returns {Date}
  ####
  startDatetime: -> cql.DateTime.fromDate(moment.utc(@_startDatetime, 'X').toDate())

  ###
  @returns {Date}
  ####
  stopDatetime: -> cql.DateTime.fromDate(moment.utc(@_stopDatetime, 'X').toDate())


###
To meet criteria using this datatype, the communication indicated by the 
Communication QDM category and its corresponding value set must be
communicated from a provider to a patient.
###
class CommunicationFromProviderToPatient
  constructor: (@entry) ->
    @_negationRationale = @entry.negationRationale
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Code}
  ####
  negationRationale: -> cql.Code(@_negationRationale.code, @_negationRationale.code_system)

  ###
  @returns {Date}
  ####
  startDatetime: -> cql.DateTime.fromDate(moment.utc(@_startDatetime, 'X').toDate())

  ###
  @returns {Date}
  ####
  stopDatetime: -> cql.DateTime.fromDate(moment.utc(@_stopDatetime, 'X').toDate())


###
To meet criteria using this datatype, the communication indicated by the
Communication QDM category and its corresponding value set must be
communicated from one provider to another.
###
class CommunicationFromProviderToProvider
  constructor: (@entry) ->
    @_negationRationale = @entry.negationRationale
    @_startDatetime = @entry.start_time
    @_stopDatetime = @entry.end_time

  ###
  @returns {Code}
  ####
  negationRationale: -> cql.Code(@_negationRationale.code, @_negationRationale.code_system)

  ###
  @returns {Date}
  ####
  startDatetime: -> cql.DateTime.fromDate(moment.utc(@_startDatetime, 'X').toDate())

  ###
  @returns {Date}
  ####
  stopDatetime: -> cql.DateTime.fromDate(moment.utc(@_stopDatetime, 'X').toDate())
