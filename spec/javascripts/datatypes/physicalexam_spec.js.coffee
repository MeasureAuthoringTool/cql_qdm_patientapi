describe "Physical Exam", ->
  describe "Performed", ->
    it "should show null relevantPeriod", ->
      physicalExamPerformed = new CQL_QDM.PhysicalExamPerformed({})
      expect(physicalExamPerformed.relevantPeriod()).toBeNull()

    it "should show valid relevantPeriod", ->
      physicalExamPerformed = new CQL_QDM.PhysicalExamPerformed({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(physicalExamPerformed.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"2017-08-31T02:00:00.00+0000","lowClosed":true,"highClosed":true}'

    it "should not return a result", ->
      physicalExamPerformed = new CQL_QDM.PhysicalExamPerformed({})
      expect(JSON.stringify(physicalExamPerformed.result())).toEqual('null')

    it "should return a result", ->
      physicalExamPerformed = new CQL_QDM.PhysicalExamPerformed({'values': [
          {_id: "5aabbc4692d04e71f32f7619", codes: { 'SNOMED-CT': ["164059009"]}, description: "Pass Or Refer"}]})
      expect(JSON.stringify(physicalExamPerformed.result())).toEqual('[{"code":"164059009","system":"SNOMED-CT","version":null,"display":"Pass Or Refer"}]')
