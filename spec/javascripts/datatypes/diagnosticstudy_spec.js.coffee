describe "Diagnostic Study", ->
  describe "Performed", ->
    it "should show null relevantPeriod", ->
      diagnosticStudyPerformed = new CQL_QDM.DiagnosticStudyPerformed({})
      expect(diagnosticStudyPerformed.relevantPeriod()).toBeNull

    it "should show valid relevantPeriod", ->
      diagnosticStudyPerformed = new CQL_QDM.DiagnosticStudyPerformed({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(diagnosticStudyPerformed.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"2017-08-31T02:00:00.00+0000","lowClosed":true,"highClosed":true}'

    it "should return null for a null facility location", ->
      diagnosticStudyPerformed = new CQL_QDM.DiagnosticStudyPerformed({})
      expect(diagnosticStudyPerformed.facilityLocation()).toBeNull

    it "should show valid facility location", ->
      diagnosticStudyPerformed = new CQL_QDM.DiagnosticStudyPerformed({'facility': {'values': [{'code': {'code': '123456', 'code_system': 'Foo'}, 'display': 'A Facility'}]}})
      expect(JSON.stringify(diagnosticStudyPerformed.facilityLocation())).toEqual('{"_code":{"code":"123456","system":"Foo","display":"A Facility"}}')
