###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}


###
Used to represent a sex.
###
class CQL_QDM.PatientCharacteristicSex extends CQL_QDM.QDMDatatype
  ###
  @param {Object} patient - the HDS patient object to use
  ###
  constructor: (@patient) ->
    @_patient = @patient

  getCode: ->
    # NOTE: Eventually this could be replaced with actual codes. That would
    # require modifications to the execution engine in order to handle that
    # change.

    # Only return string as code system is not accessible on the model and a
    # Code object without a code system fails calculations
    @_patient.get('gender')
