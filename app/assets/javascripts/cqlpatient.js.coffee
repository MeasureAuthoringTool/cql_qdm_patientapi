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
    debugger
    if profile == 'Patient'
      @getPatientCharacteristics()
    else
      # Handle Positive / Negative (negated) data criteria for QDM 5.0+
      if /Positive/.test profile
        profile = profile.replace /Positive/, ""
        return @filterDataCriteria profile, false
      else if /Negative/.test profile
        profile = profile.replace /Negative/, ""
        return @filterDataCriteria profile, true
      else
        if @_datatypes[profile]? then return @datatypes[profile] else []

  ###
  @returns {Array}
  ###
  filterDataCriteria: (profile, isNegated) ->
    results = []
    if @_datatypes[profile]?
      for dataCriteria in @_datatypes[profile]
        if dataCriteria._negationRationale? == isNegated
          results.push dataCriteria
    results

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
    # characteristics['birthDatetime'] = cql.DateTime.fromDate(moment(@_patient.get('birthdate'), 'X').toDate())
    # characteristics['gender'] = cql.DateTime.fromDate(moment(@_patient.get('gender'), 'X').toDate())
    # # TODO: More characteristics?
    # [characteristics]
    [{'birthDatetime': cql.DateTime.fromDate(moment(@_patient.get('birthdate'), 'X').toDate()), 'gender': "Female" }]
