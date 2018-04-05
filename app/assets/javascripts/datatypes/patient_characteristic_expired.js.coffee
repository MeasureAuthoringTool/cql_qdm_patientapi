###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}


###
Used to represent a birthdate.
###
class CQL_QDM.PatientCharacteristicExpired extends CQL_QDM.QDMDatatype
  ###
  @param {Object} patient - the HDS patient object to use
  ###
  constructor: (@patient) ->
    @_patient = @patient

  ###
  @returns {Object}
  ###
  getCode: ->
    if @_patient.get('deathdate')?
      # only return string as code system is not accessible on the model and a
      # Code object without a code system fails calculations
      '419099009'
    else
      ''

  ###
  @returns {Code}
  ###
  cause: ->
    throw new Error('Bonnie does not currently support PatientCharacteristicExpired.cause')

  ###
  @returns {DateTime}
  ###
  expiredDatetime: ->
    CQL_QDM.Helpers.convertDateTime(@_patient.get('deathdate'))
