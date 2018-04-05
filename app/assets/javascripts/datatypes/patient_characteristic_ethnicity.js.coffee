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
  constructor: (patient) ->
    @_patient = patient


  getCode: ->
    if @_patient?.has('ethnicity')
      # only return string as code system is not accessible on the model and a
      # Code object without a code system fails calculations
      @_patient.get('ethnicity')
    else
      null
