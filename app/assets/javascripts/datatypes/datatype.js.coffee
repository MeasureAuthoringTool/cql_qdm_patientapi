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
    @_codes = @entry?.codes

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
    for system, codes of @_codes
      for code in codes
        # return the first code of the first system in @_codes
        return new cql.Code(code, system)
        break
      break
    null

  ###
  Returns a human readable representation of this datatype.

  An example looks like:
   "Encounter, Performed: Outpatient Consultation
    START: 09/30/2012 2:00 PM
    STOP: 09/30/2012 2:15 PM
    CODE: CPT 99241"

  @returns {String}
  ###
  toString: ->
    # Grab description from entry; if blank use classname
    description = if @entry?.description then "#{@entry.description}\n" else "#{@constructor.name}\n"
    # Grab start and end time, format for proper display
    startTime = if @entry?.start_time then "START: #{moment.utc(@entry.start_time, 'X').format('MM/DD/YYYY h:mm A')}\n" else ""
    endTime = if @entry?.end_time then "STOP: #{moment.utc(@entry.end_time, 'X').format('MM/DD/YYYY h:mm A')}\n" else ""
    # Get code if this datatype has one
    code = @code() if @_codes
    codeDisplay = if code then "CODE: #{code['system']} #{code['code']}" else ""
    # Return human readable representation of this datatype
    "#{description}#{startTime}#{endTime}#{codeDisplay}".replace /\n$/, ''
