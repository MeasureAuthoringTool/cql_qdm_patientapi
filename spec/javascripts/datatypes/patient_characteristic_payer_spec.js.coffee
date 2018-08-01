describe "Patient Characteristic Payer", ->
  it "should show null relevantPeriod", ->
    patientCharacteristicPayer = new CQL_QDM.PatientCharacteristicPayer({})
    expect(patientCharacteristicPayer.relevantPeriod()).toBeNull()

  it "should show valid relevantPeriod", ->
    patientCharacteristicPayer = new CQL_QDM.PatientCharacteristicPayer({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
    expect(JSON.stringify(patientCharacteristicPayer.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.000+00:00","high":"2017-08-31T02:00:00.000+00:00","lowClosed":true,"highClosed":true}'

  it "should have CODE in toString", ->
    patientCharacteristicPayer = new CQL_QDM.PatientCharacteristicPayer({'description': 'Patient Characteristic Payer: Payer', 'start_time': '1343808000', 'end_time': '1343808900', 'codes': {'Source of Payment Typology': "1"}})
    expect(patientCharacteristicPayer.toString()).toEqual 'Patient Characteristic Payer: Payer\nSTART: 08/01/2012 8:00 AM\nSTOP: 08/01/2012 8:15 AM\nCODE: Source of Payment Typology 1'
