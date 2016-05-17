###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}


###
Base QDM datatype class; implements various functions that all implemented
QDM datatypes must support.
###
class CQL_QDM.Patient
  constructor: (@patient) ->
    @_patient = @patient

  ###
  @returns {String}
  ###
  id: ->
    @_patient.id

  ###
  @returns {Object}
  ###
  findRecords: (profile) ->
    if profile == 'Patient'
      [{ 'birth datetime': cql.DateTime.fromDate(moment.utc(@patient.get('birthdate'), 'X').toDate()) }]
    else
      console.log("::: " + profile)