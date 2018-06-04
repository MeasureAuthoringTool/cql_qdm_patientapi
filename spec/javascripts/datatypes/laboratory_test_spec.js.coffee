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
      "method":{"code_system":"SNOMED-CT","code":"133918004","title":"Comfort Measures"},
      "mood_code":"EVN",
      "negationInd":null,
      "negationReason":null,
      "oid":"2.16.840.1.113883.3.560.1.5",
      "qdm_status":{"code_system":"SNOMED-CT","code":"419099009","title":"Dead"},
      "reaction":null,
      "reason":{"code_system":"ICD-10-PCS","code":"0QPD0JZ","title":"Knee Replacement Surgery"},
      "referenceRange":null,
      "referenceRangeHigh":{"scalar":"10000","units":"mg"},
      "referenceRangeLow":{"scalar":"100","units":"mg"},
      "result_date_time":491126400,
      "specifics":null,
      "start_time":1337155200,
      "status_code":{"HL7 ActStatus":["performed"]},
      "time":null,
      "values":[{"_id":"5afc788b08fa1813ddc0a04e","codes":{"CDC Race":["2135-2"]},"description":"Ethnicity"}]
    }

    laboratoryTestPerformedEntryTwoComponents = { 
      "_id":"5b0d4cec92d04eda90d60f10",
      "codes":{"LOINC":["34714-6"]},
      "components":{"type":"COL","values":[{"code":{"code_system":"SNOMED-CT","code":"195080001"},"result":{"code":{"code_system":"SNOMED-CT","code":"419099009"},"title":"Dead"},"referenceRangeLow":{"scalar":"12","units":"mg"},"referenceRangeHigh":{"scalar":"14","units":"mg"}},{"code":{"code_system":"SNOMED-CT","code":"195080001"},"result":{"scalar":"15","units":"mg"},"referenceRangeLow":{"scalar":"12","units":"mg"},"referenceRangeHigh":{"scalar":"14","units":"mg"}}]},
      "description":"Laboratory Test, Performed: INR",
      "end_time":1338279300,
      "health_record_field":null,
      "interpretation":null,
      "method":{"code_system":"SNOMED-CT","code":"133918004","title":"Comfort Measures"},
      "mood_code":"EVN",
      "negationInd":null,
      "negationReason":null,
      "oid":"2.16.840.1.113883.3.560.1.5",
      "qdm_status":{"code_system":"SNOMED-CT","code":"419099009","title":"Dead"},
      "reaction":null,
      "reason":null,
      "referenceRange":null,
      "referenceRangeHigh":null,
      "referenceRangeLow":null,
      "result_date_time":null,
      "specifics":null,
      "start_time":1338278400,
      "status_code":{"HL7 ActStatus":["performed"]},
      "time":null
    }

    it "should return an author DateTime", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed(laboratoryTestPerformedEntry)
      expect(laboratoryTestPerformed.authorDatetime()).toEqual new cql.DateTime(2012, 5, 16, 8, 0, 0, 0, 0)

    it "should return null authorDateTime when no is start_time is specified", ->
       laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({})
       expect(laboratoryTestPerformed.authorDatetime()).toEqual null

    it "should return a method Code", ->
       laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed(laboratoryTestPerformedEntry)
       expect(laboratoryTestPerformed.method()).toEqual new cql.Code('133918004', 'SNOMED-CT')

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

    it "should return a reference range low quantity", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed(laboratoryTestPerformedEntry)
      intervalLow = new cql.Quantity({value:"100", unit:"mg"})
      intervalHigh = new cql.Quantity({value:"10000", unit:"mg"})
      expect(laboratoryTestPerformed.referenceRange()).toEqual new cql.Interval(intervalLow, intervalHigh)

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

    it "should return a status code", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed(laboratoryTestPerformedEntry)
      expect(laboratoryTestPerformed.status()).toEqual new cql.Code('419099009', 'SNOMED-CT')

    it "should return null if no status is specified", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({})
      expect(laboratoryTestPerformed.status()).toEqual null

    it "should return a component", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed(laboratoryTestPerformedEntry)
      expect(JSON.stringify(laboratoryTestPerformed.components())).toEqual '[{"_result":{"code":"309904001","system":"SNOMED-CT"},"_code":{"code":"0SQ90ZZ","system":"ICD-10-PCS"},"_referenceRange":{"low":"23","high":"35","lowClosed":true,"highClosed":true}}]'

    it "should show nothing if there is no Component", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed({})
      expect(JSON.stringify(laboratoryTestPerformed.components())).toEqual "[]"

    it "should show two Components", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed(laboratoryTestPerformedEntryTwoComponents)
      expect(JSON.stringify(laboratoryTestPerformed.components())).toEqual '[{"_result":{"code":"419099009","system":"SNOMED-CT"},"_code":{"code":"195080001","system":"SNOMED-CT"},"_referenceRange":{"low":"12","high":"14","lowClosed":true,"highClosed":true}},{"_result":{"unit":"mg","value":15},"_code":{"code":"195080001","system":"SNOMED-CT"},"_referenceRange":{"low":"12","high":"14","lowClosed":true,"highClosed":true}}]'

    it "should show Component with referenceRange low and high with units", ->
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed(laboratoryTestPerformedEntryTwoComponents)
      expect(JSON.stringify(laboratoryTestPerformed.components()[1])).toEqual '{"_result":{"unit":"mg","value":15},"_code":{"code":"195080001","system":"SNOMED-CT"},"_referenceRange":{"low":"12","high":"14","lowClosed":true,"highClosed":true}}'

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
      laboratoryTestPerformed = new CQL_QDM.LaboratoryTestPerformed(laboratoryTestPerformedEntry)
      expect(JSON.stringify(laboratoryTestPerformed.result())).toEqual('{"code":"2135-2","system":"CDC Race"}')

  describe "Order", ->
    laboratoryTestOrderEntry = {
      "_id":"5b152a7d92d04e5c9d5ee163",
      "codes":{"LOINC":["24320-4"]},
      "components":{"type":"COL","values":[{"code":{"code_system":"SNOMED-CT","code":"103705002"},
      "result":{"scalar":"12","units":"mg"}}]},
      "description":"Laboratory Test, Order: Laboratory Tests for Hypertension",
      "end_time":null,
      "health_record_field":{"code_system":"RxNorm","code":"1000001",
      "title":"Anti-Hypertensive Pharmacologic Therapy"},
      "interpretation":null,
      "method":{"code_system":"LOINC","code":"8462-4","title":"Diastolic blood pressure"},
      "mood_code":"EVN",
      "negationInd":true,
      "negationReason":{"code_system":"RxNorm","code":"1000001"},
      "oid":"2.16.840.1.113883.3.560.1.150",
      "qdm_status":{"code_system":"CDC Race","code":"2135-2","title":"Ethnicity"},
      "reaction":null,
      "reason":{"code_system":"SNOMED-CT","code":"183452005","title":"Encounter Inpatient"},
      "referenceRange":null,
      "referenceRangeHigh":{"scalar":"1000","units":"mg"},
      "referenceRangeLow":{"scalar":"500","units":"mg"},
      "result_date_time":1528876800,"specifics":null,
      "start_time":1338796800,
      "status_code":{"HL7 ActStatus":["ordered"]},
      "time":null
    }

    it "should return an author DateTime", ->
      laboratoryTestOrdered = new CQL_QDM.LaboratoryTestOrder(laboratoryTestOrderEntry)
      expect(laboratoryTestOrdered.authorDatetime()).toEqual new cql.DateTime(2012, 6, 4, 8, 0, 0, 0, 0)

    it "should return null authorDateTime when no is start_time is specified", ->
       laboratoryTestOrdered = new CQL_QDM.LaboratoryTestOrder({})
       expect(laboratoryTestOrdered.authorDatetime()).toEqual null

    it "should return a method Code", ->
       laboratoryTestOrdered = new CQL_QDM.LaboratoryTestOrder(laboratoryTestOrderEntry)
       expect(laboratoryTestOrdered.method()).toEqual new cql.Code('8462-4', 'LOINC')

    it "should return null if no method is specified", ->
       laboratoryTestOrdered = new CQL_QDM.LaboratoryTestOrder({})
       expect(laboratoryTestOrdered.method()).toEqual null

    it "should return null if no negation rationale is specified", ->
      laboratoryTestOrdered = new CQL_QDM.LaboratoryTestOrder({})
      expect(laboratoryTestOrdered.negationRationale()).toEqual null

    it "should return a negation rationale code", ->
      laboratoryTestOrdered = new CQL_QDM.LaboratoryTestOrder(laboratoryTestOrderEntry)
      expect(laboratoryTestOrdered.negationRationale()).toEqual new cql.Code('1000001', 'RxNorm')

    it "should return a reason code", ->
      laboratoryTestOrdered = new CQL_QDM.LaboratoryTestOrder(laboratoryTestOrderEntry)
      expect(laboratoryTestOrdered.reason()).toEqual new cql.Code('183452005', 'SNOMED-CT')

    it "should return null if no reason is specified", ->
      laboratoryTestOrdered = new CQL_QDM.LaboratoryTestOrder({})
      expect(laboratoryTestOrdered.reason()).toEqual null

    it "should return a status code", ->
      laboratoryTestOrdered = new CQL_QDM.LaboratoryTestOrder(laboratoryTestOrderEntry)
      expect(laboratoryTestOrdered.status()).toEqual new cql.Code('2135-2', 'CDC Race')

    it "should return null if no status is specified", ->
      laboratoryTestOrdered = new CQL_QDM.LaboratoryTestOrder({})
      expect(laboratoryTestOrdered.status()).toEqual null

  describe "Recommended", ->
    laboratoryTestRecommendedEntry = {
      "_id":"5b15a35792d04e2a00f60398",
      "codes":{"LOINC":["24320-4"]},
      "components":null,
      "description":"Laboratory Test, Recommended: Laboratory Tests for Hypertension",
      "end_time":null,
      "health_record_field":null,
      "interpretation":null,
      "method":{"code_system":"RxNorm","code":"200031","title":"Beta Blocker Therapy for LVSD"},
      "mood_code":"EVN",
      "negationInd":null,
      "negationReason":null,
      "oid":"2.16.840.1.113883.3.560.1.90",
      "qdm_status":{"code_system":"LOINC","code":"24320-4","title":"Laboratory Tests for Hypertension"},
      "reaction":null,
      "reason":{"code_system":"CDC Race","code":"2135-2","title":"Ethnicity"},
      "referenceRange":null,
      "referenceRangeHigh":null,
      "referenceRangeLow":null,
      "result_date_time":null,
      "specifics":null,
      "start_time":1338537600,
      "status_code":{"HL7 ActStatus":["recommended"]},
      "time":null
    }

    it "should return an author DateTime", ->
      laboratoryTestRecommended = new CQL_QDM.LaboratoryTestRecommended(laboratoryTestRecommendedEntry)
      expect(laboratoryTestRecommended.authorDatetime()).toEqual new cql.DateTime(2012, 6, 1, 8, 0, 0, 0, 0)

    it "should return null authorDateTime when no is start_time is specified", ->
       laboratoryTestRecommended = new CQL_QDM.LaboratoryTestRecommended({})
       expect(laboratoryTestRecommended.authorDatetime()).toEqual null

    it "should return a method Code", ->
       laboratoryTestRecommended = new CQL_QDM.LaboratoryTestRecommended(laboratoryTestRecommendedEntry)
       expect(laboratoryTestRecommended.method()).toEqual new cql.Code('200031', 'RxNorm')

    it "should return null if no method is specified", ->
       laboratoryTestRecommended = new CQL_QDM.LaboratoryTestRecommended({})
       expect(laboratoryTestRecommended.method()).toEqual null

    it "should return a reason code", ->
      laboratoryTestRecommended = new CQL_QDM.LaboratoryTestRecommended(laboratoryTestRecommendedEntry)
      expect(laboratoryTestRecommended.reason()).toEqual new cql.Code('2135-2', 'CDC Race')

    it "should return null if no reason is specified", ->
      laboratoryTestRecommended = new CQL_QDM.LaboratoryTestRecommended({})
      expect(laboratoryTestRecommended.reason()).toEqual null

    it "should return a status code", ->
      laboratoryTestRecommended = new CQL_QDM.LaboratoryTestRecommended(laboratoryTestRecommendedEntry)
      expect(laboratoryTestRecommended.status()).toEqual new cql.Code('24320-4', 'LOINC')

    it "should return null if no status is specified", ->
      laboratoryTestRecommended = new CQL_QDM.LaboratoryTestRecommended({})
      expect(laboratoryTestRecommended.status()).toEqual null
