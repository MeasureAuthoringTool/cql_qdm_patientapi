###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}

###
Used to represent a patient characteristic QDM datatype
###
class CQL_QDM.PatientCharacteristic extends CQL_QDM.QDMDatatype
  ###
  @param {Object} patient - the HDS patient object to use
  ###
  constructor: (entry) ->
    super entry
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(entry.start_time)
    @_codes = entry.codes

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime
