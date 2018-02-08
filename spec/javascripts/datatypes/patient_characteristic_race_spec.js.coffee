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

describe "Patient Characteristic Race", ->
  it "should show null code", ->
    emptyMockThorax = new ThoraxModelMock({})
    patientCharacteristicRace = new CQL_QDM.PatientCharacteristicRace(emptyMockThorax)
    expect(patientCharacteristicRace.getCode()).toBeNull()
  
  it "should show code", ->
    populatedMockThorax = new ThoraxModelMock({'race': '2106-3'})
    patientCharacteristicRace = new CQL_QDM.PatientCharacteristicRace(populatedMockThorax)
    expect(patientCharacteristicRace.getCode()).toEqual {'code' : '2106-3'}
