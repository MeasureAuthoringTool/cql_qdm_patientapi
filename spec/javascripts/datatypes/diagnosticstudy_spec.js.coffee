describe "Diagnostic Study", ->
  describe "Order", ->

    it "should not contain a method code", ->
      # method removed from Diagnostic Study, Order in QDM 5.4
      # because 'method' remains on the HDS model and because of how Bonnie shows field values
      # (based on "Diagnostic Study" rather than "Diagnostic Study, Order"), it's still possible to have it on
      # the model even when it shouldn't be. Confirm that this is not accessible through the
      # generated QDM model.
      diagnosticStudyOrder = new CQL_QDM.DiagnosticStudyOrder({})
      expect(typeof diagnosticStudyOrder.method).toEqual 'undefined'

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
      expect(JSON.stringify(diagnosticStudyPerformed.result())).toEqual('{"code":"164059009","system":"SNOMED-CT","version":null,"display":"Pass Or Refer"}')

    it "should contain a method code", ->
      procedurePerformed = new CQL_QDM.ProcedurePerformed({})
      expect(typeof procedurePerformed.method).toEqual 'function'

  describe "Recommended", ->

    it "should not contain a method code", ->
      # method removed from Diagnostic Study, Recommended in QDM 5.4
      # because 'method' remains on the HDS model and because of how Bonnie shows field values
      # (based on "Diagnostic Study" rather than "Diagnostic Study, Recommended"), it's still possible to have it on
      # the model even when it shouldn't be. Confirm that this is not accessible through the
      # generated QDM model.
      diagnosticStudyRecommended = new CQL_QDM.DiagnosticStudyRecommended({})
      expect(typeof diagnosticStudyRecommended.method).toEqual 'undefined'