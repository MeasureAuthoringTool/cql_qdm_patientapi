###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}


###
Represents a patient (using the HDS model) for use by the CQL execution
engine.
###
class CQL_QDM.CQLPatient
  constructor: (@patient, @measure) ->
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
    if profile == 'Patient' # Requested generic patient info
      @getPatientInfo()
    else if /PatientCharacteristicSex/.test profile # Requested sex
      return [new CQL_QDM.CharacteristicSex(@_patient)]
    else if /PatientCharacteristicBirthdate/.test profile # Requested birthdate
      return [new CQL_QDM.CharacteristicBirthdate(@_patient)]
    else if /PatientCharacteristicExpired/.test profile # Requested deathdate
      return [new CQL_QDM.CharacteristicExpired(@_patient)]
    else if profile?
      # Requested something else. Need to properly handle Positive / Negative
      # (negated) data criteria for QDM 5.0+.
      profile = profile.replace(/ *\{[^)]*\} */g, "") # Strip model details
      if /Positive/.test profile
        profile = profile.replace /Positive/, ""
        return @filterDataCriteria profile, false
      else if /Negative/.test profile
        profile = profile.replace /Negative/, ""
        return @filterDataCriteria profile, true
      else
        if @_datatypes[profile]? then return @_datatypes[profile] else []
    else
      []

  ###
  @returns {Array}
  ###
  filterDataCriteria: (profile, isNegated) ->
    # Search patient's history for data criteria that match the given
    # profile (keeping in mind negated status).
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
      'assessments',
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
      'social_history',
      'vital_signs'
    ]
    datatypes = {}
    for type in types
      data_criteria = @_patient.get(type)
      if data_criteria
        for dc in data_criteria
          if dc.oid? && CQL_QDM.OIDMap.oidToClassName(dc)?
            # Data criteria has an oid, and the oid is actually something
            classname = CQL_QDM.OIDMap.oidToClassName(dc)
          else
            # Either the oid is missing or it means nothing, try to
            # construct a potential classname from the description instead.
            classname = dc.description.substr(0, dc.description.indexOf(':'))
            classname = classname.replace(", ", "")
          unless datatypes[classname]?
            datatypes[classname] = []
          if classname of CQL_QDM
            cql_dc = new CQL_QDM[classname](dc)
            cql_dc['bonnie_type'] = type
            datatypes[classname].push cql_dc
    datatypes

  ###
  @returns {Object}
  ###
  getPatientInfo: ->
    info = {}
    info['birthDatetime'] = cql.DateTime.fromDate(CQL_QDM.Helpers.convertDateTime(@_patient.get('birthdate')))
    info['gender'] = @_patient.get('gender')
    [info]

  ###
  @returns {Array}
  ###
  getUniqueCoveredDataCriteria: ->
    data_criteria = []
    for type, dc_array of @_datatypes
      for dc in dc_array
        # To ensure uniqueness, describe each data criteria by its OID as
        # well as its description.
        data_criteria.push(dc.entry.oid + '_' + dc.entry.description)
    _.uniq(data_criteria)
