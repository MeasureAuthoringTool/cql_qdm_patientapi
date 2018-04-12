###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}


###
Used to represent a birthdate.
###
class CQL_QDM.PatientCharacteristicBirthdate extends CQL_QDM.QDMDatatype
  ###
  @param {Object} patient - the HDS patient object to use
  ###
  constructor: (@patient) ->
    @_patient = @patient

  ###
  @returns {Object}
  ###
  getCode: ->
    # NOTE: hard coding the code system. this will be removed when we switch
    # to the QDM patient model
    new cql.Code('21112-8', 'LOINC')

  ###
  @returns {DateTime}
  ###
  birthDatetime: ->
    CQL_QDM.Helpers.convertDateTime(@_patient.get('birthdate'))
