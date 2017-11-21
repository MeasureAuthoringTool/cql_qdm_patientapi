describe "Laboratory Test", ->
  describe "Performed", ->
    it "should show nothing if there is no Component", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({})
      expect(JSON.stringify(laboratoryTestPerformed.components())).toEqual "[]"

    it "should show just a single Component", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({'components': {"type":"COL","values":[{"code":{"code_system":"ICD-10-PCS","code":"0270346"},"result":{"scalar":"1","units":""},"referenceRangeLow":{"scalar":"","units":""},"referenceRangeHigh":{"scalar":"","units":""}}]}})
      expect(JSON.stringify(laboratoryTestPerformed.components())).toEqual '[{"_result":1,"_code":{"code":"0270346","system":"ICD-10-PCS"}}]'

    it "should show two Components", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({'components': {"type":"COL","values":[{"code":{"code_system":"ICD-10-PCS","code":"0270346"},"result":{"scalar":"1","units":""},"referenceRangeLow":{"scalar":"","units":""},"referenceRangeHigh":{"scalar":"","units":""}},{"code":{"code_system":"Source of Payment Typology","code":"1"},"result":{"scalar":"1","units":""},"referenceRangeLow":{"scalar":"","units":""},"referenceRangeHigh":{"scalar":"","units":""}}]}})
      expect(JSON.stringify(laboratoryTestPerformed.components())).toEqual '[{"_result":1,"_code":{"code":"0270346","system":"ICD-10-PCS"}},{"_result":1,"_code":{"code":"1","system":"Source of Payment Typology"}}]'

    it "should show Component with referenceRange low and high with units", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({'components': {"type":"COL","values":[{"code":{"code_system":"ICD-10-PCS","code":"0270346"},"result":{"scalar":"2","units":"mg"},"referenceRangeLow":{"scalar":"1","units":"mg"},"referenceRangeHigh":{"scalar":"3","units":"mg"}}]}})
      expect(JSON.stringify(laboratoryTestPerformed.components())).toEqual '[{"_result":{"unit":"mg","value":2},"_code":{"code":"0270346","system":"ICD-10-PCS"},"_referenceRange":{"low":"1","high":"3","lowClosed":true,"highClosed":true}}]'

    it "should show Component with referenceRange low and high without units", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({'components': {"type":"COL","values":[{"code":{"code_system":"ICD-10-PCS","code":"0270346"},"result":{"scalar":"2","units":""},"referenceRangeLow":{"scalar":"1","units":""},"referenceRangeHigh":{"scalar":"3","units":""}}]}})
      expect(JSON.stringify(laboratoryTestPerformed.components())).toEqual '[{"_result":2,"_code":{"code":"0270346","system":"ICD-10-PCS"},"_referenceRange":{"low":"1","high":"3","lowClosed":true,"highClosed":true}}]'

    it "should show Component with referenceRange low only", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({'components': {"type":"COL","values":[{"code":{"code_system":"ICD-10-PCS","code":"0270346"},"result":{"scalar":"2","units":""},"referenceRangeLow":{"scalar":"1","units":""},"referenceRangeHigh":{"scalar":"","units":""}}]}})
      expect(JSON.stringify(laboratoryTestPerformed.components())).toEqual '[{"_result":2,"_code":{"code":"0270346","system":"ICD-10-PCS"},"_referenceRange":{"low":"1","lowClosed":true,"highClosed":true}}]'

    it "should show Component with referenceRange high only", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({'components': {"type":"COL","values":[{"code":{"code_system":"ICD-10-PCS","code":"0270346"},"result":{"scalar":"2","units":""},"referenceRangeLow":{"scalar":"","units":""},"referenceRangeHigh":{"scalar":"3","units":""}}]}})
      expect(JSON.stringify(laboratoryTestPerformed.components())).toEqual '[{"_result":2,"_code":{"code":"0270346","system":"ICD-10-PCS"},"_referenceRange":{"high":"3","lowClosed":true,"highClosed":true}}]'

    it "should show null relevantPeriod", ->
      laboratoryTestPerformed = new CQL_QDM.AdverseEvent({})
      expect(laboratoryTestPerformed.relevantPeriod()).toBeNull()

    it "should show valid relevantPeriod", ->
      laboratoryTestPerformed = new CQL_QDM.AdverseEvent({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(laboratoryTestPerformed.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"2017-08-31T02:00:00.00+0000","lowClosed":true,"highClosed":true}'
