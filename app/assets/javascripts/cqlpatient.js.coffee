###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}


###
Represents a patient (using the HDS model) for use by the CQL execution
engine.
###
class CQL_QDM.CQLPatient
  constructor: (@patient) ->
    @_patient = @patient
    @_datatypes = @buildDatatypes()

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
      @getPatientCharacteristics()
    else
      return if @_datatypes[profile]? then @_datatypes[profile] else []

  ###
  @returns {Object}
  ###
  buildDatatypes: ->
    types = [
      'allergies',
      'care_goals',
      'conditions',
      'encounters',
      'communications',
      'family_history',
      'immunizations',
      'medical_equipment',
      'medications',
      'procedures',
      'results',
      'social_history'
    ]
    datatypes = {}
    for type in types
      data_criteria = @_patient.get(type)
      if data_criteria
        for dc in data_criteria
          if dc.oid == null
            classname = dc.description.substr(0, dc.description.indexOf(':'))
          else
            classname = CQL_QDM.OIDMap.oidToClassName(dc)
          unless datatypes[classname]?
            datatypes[classname] = []
          cql_dc = new CQL_QDM[classname](dc)
          cql_dc['bonnie_type'] = type
          datatypes[classname].push cql_dc
    datatypes

  ###
  @returns {Object}
  ###
  getPatientCharacteristics: ->
    # characteristics = {}
    # characteristics['birthDatetime'] = cql.DateTime.fromDate(moment.utc(@_patient.get('birthdate'), 'X').toDate())
    # characteristics['gender'] = cql.DateTime.fromDate(moment.utc(@_patient.get('gender'), 'X').toDate())
    # # TODO: More characteristics?
    # [characteristics]
    [{ 'birth datetime': cql.DateTime.fromDate(moment.utc(@patient.get('birthdate'), 'X').toDate()) }]