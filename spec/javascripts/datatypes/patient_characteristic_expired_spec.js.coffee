describe "Patient Characteristic Expired", ->
  xit "should show null deathdate", ->
    patientCharacteristicExpired = new CQL_QDM.PatientCharacteristicExpired({})
    expect(patientCharacteristicExpired.expiredDatetime()).toBeNull

  xit "should show valid deathdate", ->
    patientCharacteristicExpired = new CQL_QDM.PatientCharacteristicExpired({'deathdate': '08/31/2017 1:00 AM'})
    expect(JSON.stringify(patientCharacteristicExpired.expiredDatetime())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"2017-08-31T02:00:00.00+0000","lowClosed":true,"highClosed":true}'

  it "Should throw an error when cause() is called", ->
    patientCharacteristicExpired = new CQL_QDM.PatientCharacteristicExpired({'deathdate': '08/31/2017 1:00 AM'})
    expect(patientCharacteristicExpired.cause).toThrowError('Bonnie does not currently support PatientCharacteristicExpired.cause')
