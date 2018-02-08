# The cql_qdm_patientapi datatypes for patient Characteristics use the patient
# thorax model which uses .get and .has functions to access attributes. For testing
# purposes we need to mock this functionality.
class ThoraxModelMock
  constructor: (attr) ->
    @attrs = attr
  has: (field) ->
    @attrs[field]?
  get: (field) ->
    @attrs[field]

describe "Patient Characteristic Ethnicity", ->
  it "should show null code", ->
    emptyMockThorax = new ThoraxModelMock({})
    patientCharacteristicEthnicity = new CQL_QDM.PatientCharacteristicEthnicity(emptyMockThorax)
    expect(patientCharacteristicEthnicity.getCode()).toBeNull()

  it "should show code", ->
    populatedMockThorax = new ThoraxModelMock({'ethnicity': '2186-5'})
    patientCharacteristicEthnicity = new CQL_QDM.PatientCharacteristicEthnicity(populatedMockThorax)
    expect(patientCharacteristicEthnicity.getCode()).toEqual {'code' : '2186-5'}
