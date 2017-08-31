describe "Laboratory Test", ->
  describe "Performed", ->
    it "should show nothing if there is no Component", ->
      encounterPerformed = new CQL_QDM.LaboratoryTestPerformed({})
      expect(JSON.stringify(encounterPerformed.components())).toEqual "[]"
    
    it "should show just a single Component", ->
      encounterPerformed = new CQL_QDM.LaboratoryTestPerformed({'components': {"type":"COL","values":[{"code":{"code_system":"ICD-10-PCS","code":"0270346"},"result":{"scalar":"1","units":""},"referenceRangeLow":{"scalar":"","units":""},"referenceRangeHigh":{"scalar":"","units":""}}]}})
      expect(JSON.stringify(encounterPerformed.components())).toEqual '[{"result":{"unit":"","value":1},"code":{"code":"0270346","system":"ICD-10-PCS"}}]'

    it "should show two Components", ->
      encounterPerformed = new CQL_QDM.LaboratoryTestPerformed({'components': {"type":"COL","values":[{"code":{"code_system":"ICD-10-PCS","code":"0270346"},"result":{"scalar":"1","units":""},"referenceRangeLow":{"scalar":"","units":""},"referenceRangeHigh":{"scalar":"","units":""}},{"code":{"code_system":"Source of Payment Typology","code":"1"},"result":{"scalar":"1","units":""},"referenceRangeLow":{"scalar":"","units":""},"referenceRangeHigh":{"scalar":"","units":""}}]}})
      expect(JSON.stringify(encounterPerformed.components())).toEqual '[{"result":{"unit":"","value":1},"code":{"code":"0270346","system":"ICD-10-PCS"}},{"result":{"unit":"","value":1},"code":{"code":"1","system":"Source of Payment Typology"}}]'

    it "should show Component with referenceRange low and high with units", ->
      encounterPerformed = new CQL_QDM.LaboratoryTestPerformed({'components': {"type":"COL","values":[{"code":{"code_system":"ICD-10-PCS","code":"0270346"},"result":{"scalar":"2","units":"mg"},"referenceRangeLow":{"scalar":"1","units":"mg"},"referenceRangeHigh":{"scalar":"3","units":"mg"}}]}})
      expect(JSON.stringify(encounterPerformed.components())).toEqual '[{"result":{"unit":"mg","value":2},"code":{"code":"0270346","system":"ICD-10-PCS"},"range":{"low":"1","high":"3","lowClosed":true,"highClosed":true}}]'

    it "should show Component with referenceRange low and high without units", ->
      encounterPerformed = new CQL_QDM.LaboratoryTestPerformed({'components': {"type":"COL","values":[{"code":{"code_system":"ICD-10-PCS","code":"0270346"},"result":{"scalar":"2","units":""},"referenceRangeLow":{"scalar":"1","units":""},"referenceRangeHigh":{"scalar":"3","units":""}}]}})
      expect(JSON.stringify(encounterPerformed.components())).toEqual '[{"result":{"unit":"","value":2},"code":{"code":"0270346","system":"ICD-10-PCS"},"range":{"low":"1","high":"3","lowClosed":true,"highClosed":true}}]'

    it "should show Component with referenceRange low only", ->
      encounterPerformed = new CQL_QDM.LaboratoryTestPerformed({'components': {"type":"COL","values":[{"code":{"code_system":"ICD-10-PCS","code":"0270346"},"result":{"scalar":"2","units":""},"referenceRangeLow":{"scalar":"1","units":""},"referenceRangeHigh":{"scalar":"","units":""}}]}})
      expect(JSON.stringify(encounterPerformed.components())).toEqual '[{"result":{"unit":"","value":2},"code":{"code":"0270346","system":"ICD-10-PCS"},"range":{"low":"1","lowClosed":true,"highClosed":true}}]'

    it "should show Component with referenceRange high only", ->
      encounterPerformed = new CQL_QDM.LaboratoryTestPerformed({'components': {"type":"COL","values":[{"code":{"code_system":"ICD-10-PCS","code":"0270346"},"result":{"scalar":"2","units":""},"referenceRangeLow":{"scalar":"","units":""},"referenceRangeHigh":{"scalar":"3","units":""}}]}})
      expect(JSON.stringify(encounterPerformed.components())).toEqual '[{"result":{"unit":"","value":2},"code":{"code":"0270346","system":"ICD-10-PCS"},"range":{"high":"3","lowClosed":true,"highClosed":true}}]'