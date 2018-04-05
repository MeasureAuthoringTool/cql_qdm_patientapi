###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}


###
Used to represent a race.
###
class CQL_QDM.PatientCharacteristicRace extends CQL_QDM.QDMDatatype
  ###
  @param {Object} patient - the HDS patient object to use
  ###
  constructor: (patient) ->
    @_patient = patient


  getCode: ->
    if @_patient?.has('race')
      # only return string as code system is not accessible on the model and a
      # Code object without a code system fails calculations
      @_patient.get('race')
    else
      null
