###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}


###
Used to represent a birthdate.
###
class CQL_QDM.CharacteristicBirthdate extends CQL_QDM.QDMDatatype
  constructor: (@patient) ->
    @_patient = @patient

  ###
  @returns {Object}
  ###
  getCode: ->
    code:
      'Birthdate'

  ###
  @returns {DateTime}
  ###
  birthDatetime: ->
    CQL_QDM.Helpers.convertDateTime(@_patient.get('birthdate'))
