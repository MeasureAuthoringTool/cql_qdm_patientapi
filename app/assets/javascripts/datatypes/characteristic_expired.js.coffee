###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}


###
Used to represent a birthdate.
###
class CQL_QDM.CharacteristicExpired extends CQL_QDM.QDMDatatype
  constructor: (@patient) ->
    @_patient = @patient

  ###
  @returns {Object}
  ###
  getCode: ->
    if @_patient.get('deathdate')?
      code:
        'Dead'
    else
      code:
        ''

  ###
  @returns {DateTime}
  ###
  expiredDatetime: ->
    CQL_QDM.Helpers.convertDateTime(@_patient.get('deathdate'))
