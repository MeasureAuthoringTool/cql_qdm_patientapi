###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}


###
Used to represent a sex.
###
class CQL_QDM.CharacteristicSex extends CQL_QDM.QDMDatatype
  ###
  @param {Object} patient - the HDS patient object to use
  ###
  constructor: (@patient) ->
    @_patient = @patient

  getCode: ->
    # NOTE: Eventually this could be replaced with actual codes. That would
    # require modifications to the execution engine in order to handle that
    # change.
    code:
      @_patient.get('gender')
