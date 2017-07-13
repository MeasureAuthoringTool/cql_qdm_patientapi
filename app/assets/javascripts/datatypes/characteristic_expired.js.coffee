###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}


###
Used to represent a birthdate.
###
class CQL_QDM.CharacteristicExpired extends CQL_QDM.QDMDatatype
  ###
  @param {Object} patient - the HDS patient object to use
  ###
  constructor: (@patient) ->
    @_patient = @patient

  ###
  @returns {Object}
  ###
  getCode: ->
    # NOTE: Eventually this could be replaced with actual codes. That would
    # require modifications to the execution engine in order to handle that
    # change.
    if @_patient.get('deathdate')?
      '419099009'
    else
      code:
        ''

  ###
  @returns {DateTime}
  ###
  expiredDatetime: ->
    CQL_QDM.Helpers.convertDateTime(@_patient.get('deathdate'))
