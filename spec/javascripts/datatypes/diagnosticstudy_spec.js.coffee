describe "Diagnostic Study", ->
  describe "Performed", ->
    it "should show null relevantPeriod", ->
      diagnosticStudyPerformed = new CQL_QDM.DiagnosticStudyPerformed({})
      expect(diagnosticStudyPerformed.relevantPeriod()).toBeNull()

    it "should show valid relevantPeriod", ->
      diagnosticStudyPerformed = new CQL_QDM.DiagnosticStudyPerformed({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(diagnosticStudyPerformed.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.000+00:00","high":"2017-08-31T02:00:00.000+00:00","lowClosed":true,"highClosed":true}'

    it "should return null for a null facility location", ->
      diagnosticStudyPerformed = new CQL_QDM.DiagnosticStudyPerformed({})
      expect(diagnosticStudyPerformed.facilityLocation()).toBeNull()

    it "should show valid facility location", ->
      diagnosticStudyPerformed = new CQL_QDM.DiagnosticStudyPerformed({'facility': {'values': [{'code': {'code': '123456', 'code_system': 'Foo'}, 'display': 'A Facility'}]}})
      expect(JSON.stringify(diagnosticStudyPerformed.facilityLocation())).toEqual('{"_code":{"code":"123456","system":"Foo","display":"A Facility"}}')

    it "should not return a result", ->
      diagnosticStudyPerformed = new CQL_QDM.DiagnosticStudyPerformed({})
      expect(JSON.stringify(diagnosticStudyPerformed.result())).toEqual('null')

    it "should return a result", ->
      diagnosticStudyPerformed = new CQL_QDM.DiagnosticStudyPerformed({'values': [
          {_id: "5aabbc4692d04e71f32f7619", codes: { 'SNOMED-CT': ["164059009"]}, description: "Pass Or Refer"}]})
      expect(JSON.stringify(diagnosticStudyPerformed.result())).toEqual('{"code":"164059009","system":"SNOMED-CT"}')
