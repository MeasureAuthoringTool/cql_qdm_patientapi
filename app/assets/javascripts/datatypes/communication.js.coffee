###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}


###
To meet criteria using this datatype, the communication indicated by the
Communication QDM category and its corresponding value set must be
communicated from a patient to a provider.
###
class CQL_QDM.CommunicationFromPatientToProvider extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_negationRationale = @entry.negationReason
    @_relatedTo = @entry.relatedTo

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
  @returns {Array}
  ###
  relatedTo: ->
    relatedToArray = []
    if @_relatedTo
      for relatedTo in @_relatedTo.values
        if relatedTo?
          relatedToArray.push new cql.Code(relatedTo.code, relatedTo.code_system)
    relatedToArray

###
To meet criteria using this datatype, the communication indicated by the
Communication QDM category and its corresponding value set must be
communicated from a provider to a patient.
###
class CQL_QDM.CommunicationFromProviderToPatient extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_negationRationale = @entry.negationReason
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_relatedTo = @entry.relatedTo

  ###
  @returns {Code}
  ###
  negationRationale: ->
    new cql.Code(@_negationRationale?.code, @_negationRationale?.code_system)

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime

  ###
  @returns {Array}
  ###
  relatedTo: ->
    relatedToArray = []
    if @_relatedTo
      for relatedTo in @_relatedTo.values
        if relatedTo?
          relatedToArray.push new cql.Code(relatedTo.code, relatedTo.code_system)
    relatedToArray

###
To meet criteria using this datatype, the communication indicated by the
Communication QDM category and its corresponding value set must be
communicated from one provider to another.
###
class CQL_QDM.CommunicationFromProviderToProvider extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (@entry) ->
    super @entry
    @_negationRationale = @entry.negationReason
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_relatedTo = @entry.relatedTo

  ###
  @returns {Code}
  ###
  negationRationale: ->
    new cql.Code(@_negationRationale?.code, @_negationRationale?.code_system)

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime

  ###
  @returns {Array}
  ###
  relatedTo: ->
    relatedToArray = []
    if @_relatedTo
      for relatedTo in @_relatedTo.values
        if relatedTo?
          relatedToArray.push new cql.Code(relatedTo.code, relatedTo.code_system)
    relatedToArray