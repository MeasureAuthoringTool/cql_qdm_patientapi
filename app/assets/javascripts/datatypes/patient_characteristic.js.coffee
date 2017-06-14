###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}

###
Used to represent a sex.
###
class CQL_QDM.PatientCharacteristic extends CQL_QDM.QDMDatatype
  ###
  @param {Object} patient - the HDS patient object to use
  ###
  constructor: (@entry) ->
    super @entry
    debugger
    @_authorDatetime = CQL_QDM.Helpers.convertDateTime(@entry.start_time)
    @_codes = @entry.codes
    
    
  ###
  @returns {Date}
  ###
  authorDatetime: ->
    @_authorDatetime

  ###
  @returns {Array}
  ###
  getCode: ->
    allCodes = []
    for system, codes of @_codes
      for code in codes
        allCodes.push code: code
    allCodes
