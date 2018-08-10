describe "Physical Exam", ->
  describe "Order", ->
    it "should not contain a method code", ->
      # method removed from Physical Exam, Order in QDM 5.4
      # because 'method' remains on the HDS model and because of how Bonnie shows field values
      # (based on "Physical Exam" rather than "Physical Exam, Order"), it's still possible to have it on
      # the model even when it shouldn't be. Confirm that this is not accessible through the
      # generated QDM model.
      phyicalExamOrder = new CQL_QDM.PhysicalExamOrder({})
      expect(typeof phyicalExamOrder.method).toEqual 'undefined'

  describe "Performed", ->
    it "should show null relevantPeriod", ->
      physicalExamPerformed = new CQL_QDM.PhysicalExamPerformed({})
      expect(physicalExamPerformed.relevantPeriod()).toBeNull()

    it "should show valid relevantPeriod", ->
      physicalExamPerformed = new CQL_QDM.PhysicalExamPerformed({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(physicalExamPerformed.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.000+00:00","high":"2017-08-31T02:00:00.000+00:00","lowClosed":true,"highClosed":true}'

    it "should not return a result", ->
      physicalExamPerformed = new CQL_QDM.PhysicalExamPerformed({})
      expect(JSON.stringify(physicalExamPerformed.result())).toEqual('null')

    it "should return a result", ->
      physicalExamPerformed = new CQL_QDM.PhysicalExamPerformed({'values': [
          {_id: "5aabbc4692d04e71f32f7619", codes: { 'SNOMED-CT': ["164059009"]}, description: "Pass Or Refer"}]})
      expect(JSON.stringify(physicalExamPerformed.result())).toEqual('{"code":"164059009","system":"SNOMED-CT","version":null,"display":"Pass Or Refer"}')

    it "should contain a method code", ->
      physicalExamPerformed = new CQL_QDM.PhysicalExamPerformed({})
      expect(typeof physicalExamPerformed.method).toEqual 'function'

  describe "Recommended", ->
    it "should not contain a method code", ->
      # method removed from Physical Exam, Recommended in QDM 5.4
      # because 'method' remains on the HDS model and because of how Bonnie shows field values
      # (based on "Physical Exam" rather than "Physical Exam, Recommended"), it's still possible to have it on
      # the model even when it shouldn't be. Confirm that this is not accessible through the
      # generated QDM model.
      phyicalExamRecommended = new CQL_QDM.PhysicalExamRecommended({})
      expect(typeof phyicalExamRecommended.method).toEqual 'undefined'
