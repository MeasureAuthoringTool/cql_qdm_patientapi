###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}


###
Represents a patient (using the HDS model) for use by the CQL execution
engine.

Typical flow of usage:
1.  Bonnie takes one of its patient records and creates a CQL_QDM.CQLPatient
    for it.
1a. This class takes that patient record and checks for data criteria that
    exist on it.
1b. When it finds a data criteria record, it creates an equivalent
    CQL_QDM.QDMDatatype instance of that data criteria, and attaches it to
    the instance of this patient. This process happens in the 'buildDatatypes'
    method.
2.  When the CQL execution engine comes across a retrieve statement (e.g.
    ["Encounter Performed"]), it will call 'findRecords' on this class with
    the name of that profile. The 'findRecords' method will do some parsing,
    and eventually return an array of CQL_QDM.QDMDatatype(s) that both
    match that profile and exist on the instance of this patient.
3.  The CQL_QDM.QDMDatatype directly represents a QDM datatype. The classes
    that subclass this class (e.g. CQL_QDM.EncounterActive) provide methods
    that represent the relevant QDM datatypes attributes (e.g.
    CQL_QDM.EncounterActive.relevantPeriod).
4.  When a CQL statement takes a data criteria and wants to check an attribute
    of it, it calls the 'get' method of the CQL_QDM.QDMDatatype superclass with
    the name of that attribute. This 'get' method takes that attribute and
    calls the relevant attribute method on that data criteria.
5.  Each attribute method of a CQL_QDM.QDMDatatype correctly converts the
    Bonnie value for something into a form that the CQL execution engine
    can understand.
###
class CQL_QDM.CQLPatient
  constructor: (patient) ->
    @_patient = patient
    @_datatypes = @buildDatatypes()

  ###
  @returns {String}
  ###
  id: ->
    @_patient.id

  ###
  This method is called by the CQL execution engine on a CQLPatient when
  the execution engine wants information on a record. A record could be patient
  characteristic information about the patient, or it could be data criteria
  that currently exist on this patient (data criteria you drag on a patient
  in Bonnie's patient builder).

  @param {String} profile - the data criteria requested by the execution engine
  @returns {Object}
  ###
  findRecords: (profile) ->
    if profile == 'Patient'
      # Requested generic patient info
      @getPatientMetadata()
    else if /PatientCharacteristic/.test profile
      # Requested a patient characteristic
      @getPatientCharacteristic(profile)
    else if profile?
      # Requested something else (probably a QDM data type).

      # Strip model details from request
      profile = profile.replace(/ *\{[^)]*\} */g, '')

      # Check and handle negation status
      if /Positive/.test profile
        profile = profile.replace /Positive/, ''
        # Since the data criteria is 'Positive', it is not negated.
        return @getNegatableDataCriteria(profile, false)
      else if /Negative/.test profile
        profile = profile.replace /Negative/, ''
        # Since the data criteria is 'Negative', it is negated.
        return @getNegatableDataCriteria(profile, true)
      else
        # No negation status, proceed normally
        if @_datatypes[profile]? then return @_datatypes[profile] else []
    else
      []

  ###
  Handles requests for patient characteristic information (e.g. birthdate).

  @param {String} profile - the data criteria requested by the execution engine
  @returns {Array of Objects}
  ###
  getPatientCharacteristic: (profile) ->
    if /PatientCharacteristicSex/.test profile
      # Requested sex
      [new CQL_QDM.CharacteristicSex(@_patient)]
    else if /PatientCharacteristicBirthdate/.test profile
      # Requested birthdate
      [new CQL_QDM.CharacteristicBirthdate(@_patient)]
    else if /PatientCharacteristicExpired/.test profile
      # Requested deathdate
      [new CQL_QDM.CharacteristicExpired(@_patient)]
    else
      # Unsupported
      []

  ###
  Searches the patient's history for data criteria that match the given
  profile (keeping in mind negated status). Specifically, if we wanted
  something that was negated, and we only have an instance of that thing
  without a negation, we would not include it.

  @param {String} profile - the data criteria requested by the execution engine
  @param {Boolean} isNegated - the negated type of data criteria to look for
  @returns {Array}
  ###
  getNegatableDataCriteria: (profile, isNegated) ->
    results = []
    if @_datatypes[profile]?
      for dataCriteria in @_datatypes[profile]
        if dataCriteria.negationRationale?() == isNegated
          results.push dataCriteria
    results

  ###
  This method searches through the Bonnie patient for data criteria (i.e. the
  data criteria that have been dragged on a patient in Bonnie's patient
  builder). It then takes what it finds and creates CQL_QDM.QDMDatatype
  versions of them for future lookups by the execution engine.

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
      'vital_signs',
      'devices',
      'diagnostic_studies',
      'functional_statuses',
      'interventions',
      'laboratory_tests',
      'physical_exams',
      'risk_category_assessments',
      'care_experiences',
      'preferences',
      'provider_characteristics',
      'substances',
      'system_characteristics',
      'transfers'
    ]
    data_types = {}
    for type in types
      data_criteria = @_patient.get(type)
      if data_criteria
        # Looks like this patient has at least one instance of this type of
        # data criteria; loop over them and create CQL_QDM.QDMDatatype of them.
        for dc in data_criteria
          # Construct a classname from the data criteria
          # e.g. "Encounter, Performed: Face-to-Face Interaction" becomes
          # EncounterPerformed
          classname = dc.description.substr(0, dc.description.indexOf(':'))
          classname = classname.replace(/,/g, '')
          classname = classname.replace(/ /g, '')
          unless data_types[classname]?
            data_types[classname] = []
          if classname of CQL_QDM
            cql_dc = new CQL_QDM[classname](dc)
            # Keep track of the 'bonnie' type for use in the 'Learn CQL' tool
            cql_dc['bonnie_type'] = type
            data_types[classname].push cql_dc
    data_types

  ###
  Returns metadata information about this patient.
  This metadata is composed of:
    - birthDatetime (the birth date and time of the patient)
    - gender (the sex of the patient)

  @returns {Object}
  ###
  getPatientMetadata: ->
    info = {}
    info['birthDatetime'] = CQL_QDM.Helpers.convertDateTime(@_patient.get('birthdate'))
    info['gender'] = @_patient.get('gender')
    [info]

  ###
  Returns an array of unique data criteria information that exist on this
  patient. This is used for the first pass effort of calculating coverage.

  TODO: Eventually this can be removed when we fine tune how measure
        coverage is calculated.

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
