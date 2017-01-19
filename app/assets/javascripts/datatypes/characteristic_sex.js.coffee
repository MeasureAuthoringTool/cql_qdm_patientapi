###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}


###
Used to represent a sex.
###
class CQL_QDM.CharacteristicSex extends CQL_QDM.QDMDatatype
  constructor: (@patient) ->
    @_patient = @patient
  
  getCode: ->
    code:
      @_patient.get('gender')
