###
@namespace scoping into the CQL_QDM namespace
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
        allCodes.push code: code
    allCodes
