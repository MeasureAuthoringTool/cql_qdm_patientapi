###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}


###
Base QDM datatype class; implements various functions that all implemented
QDM datatypes must support.
###
class CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    @_codes = @entry.codes

  ###
  Returns any instances of this attribute currently within this namespace.

  @param {String} attribute - the QDM attribute to access
  @returns {Date|Code|Quantity|String}
  ###
  get: (attribute) ->
    @[attribute]?()

  ###
  @returns {Array}
  ###
  getCode: ->
    allCodes = []
    for system, codes of @_codes
      for code in codes
        allCodes.push system: system, code: code
    allCodes

  ###
  Returns the QDM Id of this entry. If there is no entry for this instance, return null.

  @returns {Id}
  ###
  id: ->
    if @entry?._id?
      return new CQL_QDM.Id(@entry._id)
    else
      null

  ###
  @returns {Code}
  ###
  code: ->
    codeArray = @getCode()
    if codeArray.length > 0 and codeArray[0].code? and codeArray[0].system?
      new cql.Code(codeArray[0].code, codeArray[0].system)
    else
      null

