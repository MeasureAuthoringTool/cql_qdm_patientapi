describe "Patient Characteristic Payer", ->
  it "should show null relevantPeriod", ->
    patientCharacteristicPayer = new CQL_QDM.PatientCharacteristicPayer({})
    expect(patientCharacteristicPayer.relevantPeriod()).toEqual null

  it "should show valid relevantPeriod", ->
    patientCharacteristicPayer = new CQL_QDM.PatientCharacteristicPayer({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
    expect(JSON.stringify(patientCharacteristicPayer.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"2017-08-31T02:00:00.00+0000","lowClosed":true,"highClosed":true}'
