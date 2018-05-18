describe "Laboratory Test", ->
  describe "Performed", ->
    laboratoryTestPerformedEntry = {
      "_id":"5afc788b08fa1813ddc0a04d",
      "codes":{"LOINC":["34714-6"]},
      "components":{"type":"COL","values":[{"code":{"code_system":"ICD-10-PCS","code":"0SQ90ZZ"},"result":{"code":{"code_system":"SNOMED-CT","code":"309904001"},"title":"Intensive Care Unit"},"referenceRangeLow":{"scalar":"23","units":"mg"},"referenceRangeHigh":{"scalar":"35","units":"mg"}}]},
      "description":"Laboratory Test, Performed: INR",
      "end_time":1337156100,
      "health_record_field":null,
      "interpretation":null,
      "method":null,
      "mood_code":"EVN",
      "negationInd":null,
      "negationReason":null,
      "oid":"2.16.840.1.113883.3.560.1.5",
      "qdm_status":{"code_system":"ICD-10-PCS","code":"0T1307B","title":"Urological Surgery"},
      "reaction":null,
      "reason":{"code_system":"ICD-10-PCS","code":"0QPD0JZ","title":"Knee Replacement Surgery"},
      "referenceRange":null,
      "referenceRangeHigh":"{\"scalar\"=>\"35\", \"units\"=>\"mg\"}",
      "referenceRangeLow":"{\"scalar\"=>\"23\", \"units\"=>\"mg\"}",
      "result_date_time":491126400,
      "specifics":null,
      "start_time":1337155200,
      "status_code":{"HL7 ActStatus":["performed"]},
      "time":null,
      "values":[{"_id":"5afc788b08fa1813ddc0a04e","codes":{"CDC Race":["2135-2"]},"description":"Ethnicity"}]
    }

    it "should return an author DateTime", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed(laboratoryTestPerformedEntry)
      expect(laboratoryTestPerformed.authorDatetime()).toEqual new cql.DateTime(2012, 5, 16, 8, 0, 0, 0, 0)

    it "should return null authorDateTime when no is start_time is specified", ->
       laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({})
       expect(laboratoryTestPerformed.authorDatetime()).toEqual null

    # it "should return a method Code", ->
    #    laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed(laboratoryTestPerformedEntry)
    #    expect(laboratoryTestPerformed.method()).toEqual 'something'

    it "should return null if no method is specified", ->
       laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({})
       expect(laboratoryTestPerformed.method()).toEqual null

    it "should return null if no negation rationale is specified", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({})
      expect(laboratoryTestPerformed.negationRationale()).toEqual null

    it "should return a reason code", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed(laboratoryTestPerformedEntry)
      expect(laboratoryTestPerformed.reason()).toEqual new cql.Code('0QPD0JZ', 'ICD-10-PCS')

    it "should return null if no reason is specified", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({})
      expect(laboratoryTestPerformed.reason()).toEqual null

    # it "should return a reference range interval", ->
    #   laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed(laboratoryTestPerformedEntry)
    #   expect(laboratoryTestPerformed.referenceRange()).toEqual new cql.Interval(1,2)

    it "should return null if no reference range is specified ", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({})
      expect(laboratoryTestPerformed.referenceRange()).toEqual null

    it "should return a relevantPeriod interval", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed(laboratoryTestPerformedEntry)
      expect(laboratoryTestPerformed.relevantPeriod()).toEqual new cql.Interval(new cql.DateTime(2012, 5, 16, 8, 0, 0, 0, 0), new cql.DateTime(2012, 5, 16, 8, 15, 0, 0, 0))

    it "should return null if no relevant period is specified ", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({})
      expect(laboratoryTestPerformed.relevantPeriod()).toEqual null

    it "should return a result object", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed(laboratoryTestPerformedEntry)
      expect(laboratoryTestPerformed.result()).toEqual new cql.Code('2135-2', 'CDC Race')

    it "should return null if no result is specified ", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({})
      expect(laboratoryTestPerformed.result()).toEqual null

    it "should return resultDatetime", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed(laboratoryTestPerformedEntry)
      expect(laboratoryTestPerformed.resultDatetime()).toEqual new cql.DateTime(1985, 7, 25, 8, 0, 0, 0, 0)

    it "should return null if no resultDatetime", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({})
      expect(laboratoryTestPerformed.resultDatetime()).toEqual null

    # it "should return a status code", ->
    #   laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed(laboratoryTestPerformedEntry)
    #   expect(laboratoryTestPerformed.status()).toEqual new cql.Code()

    it "should return null if no status is specified", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({})
      expect(laboratoryTestPerformed.status()).toEqual null

    it "should return a component", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed(laboratoryTestPerformedEntry)
      expect(JSON.stringify(laboratoryTestPerformed.components())).toEqual '[{"_result":{"code":"309904001","system":"SNOMED-CT"},"_code":{"code":"0SQ90ZZ","system":"ICD-10-PCS"},"_referenceRange":{"low":"23","high":"35","lowClosed":true,"highClosed":true}}]'

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
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({})
      expect(laboratoryTestPerformed.relevantPeriod()).toBeNull()

    it "should show valid relevantPeriod", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(laboratoryTestPerformed.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.000+00:00","high":"2017-08-31T02:00:00.000+00:00","lowClosed":true,"highClosed":true}'

    it "should not return a result", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({})
      expect(JSON.stringify(laboratoryTestPerformed.result())).toEqual('null')

    it "should return a result", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({'values': [
          {_id: "5aabbc4692d04e71f32f7619", codes: { 'SNOMED-CT': ["164059009"]}, description: "Pass Or Refer"}]})
      expect(JSON.stringify(laboratoryTestPerformed.result())).toEqual('{"code":"164059009","system":"SNOMED-CT"}')
