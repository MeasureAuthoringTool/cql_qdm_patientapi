###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}


###
Used to represent a ethnicity.
###
class CQL_QDM.PatientCharacteristicEthnicity extends CQL_QDM.QDMDatatype
  ###
  @param {Object} patient - the HDS patient object to use
  ###

  constructor: (@patient) ->
    super @patient
    @_patient = @patient


  getCode: ->
    if @_patient?.ethnicity?
      code: @_patient.get('ethnicity')
    else
      null
