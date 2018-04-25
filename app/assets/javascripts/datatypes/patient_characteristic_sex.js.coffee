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
    # NOTE: hard coding the code system. this will be removed when we switch
    # to the QDM patient model
    new cql.Code(@_patient.get('gender'), 'AdministrativeGender')
