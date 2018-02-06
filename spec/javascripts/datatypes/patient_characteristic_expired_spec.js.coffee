class ThoraxModelMock
  constructor: (attr) ->
    @attrs = attr
  has: (field) ->
    @attrs[field]?
  get: (field) ->
    @attrs[field]

describe "Patient Characteristic Expired", ->
  it "should show null deathdate", ->
    emptyMockThorax = new ThoraxModelMock({})
    patientCharacteristicExpired = new CQL_QDM.PatientCharacteristicExpired(emptyMockThorax)
    expect(patientCharacteristicExpired.expiredDatetime()).toBeNull()

  it "should show valid deathdate", ->
    populatedMockThorax = new ThoraxModelMock({'deathdate': '08/31/2017 1:00 AM'})
    patientCharacteristicExpired = new CQL_QDM.PatientCharacteristicExpired(populatedMockThorax)
    expect(JSON.stringify(patientCharacteristicExpired.expiredDatetime())).toEqual '"2017-08-31T01:00:00.00+0000"'

  it "Should throw an error when cause() is called", ->
    patientCharacteristicExpired = new CQL_QDM.PatientCharacteristicExpired({'deathdate': '08/31/2017 1:00 AM'})
    expect(patientCharacteristicExpired.cause).toThrowError('Bonnie does not currently support PatientCharacteristicExpired.cause')
