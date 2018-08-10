describe "Substance", ->
  describe "Administered", ->
    substanceAdministeredEntry = {
      "_id":"5afefb8608fa185cd1c70f3e",
      "active_datetime":null,
      "administrationTiming":{"code_system":"RxNorm","code":"1002293","title":"Common substances for allergy and intolerance documentation"},
      "allowedAdministrations":null,
      "anatomical_approach":null,
      "codes":{"RxNorm":["1002293"],"SNOMED-CT":["102259006"]},
      "cumulativeMedicationDuration":null,
      "deliveryMethod":null,
      "description":"Substance, Administered: Common substances for allergy and intolerance documentation",
      "dose":{"scalar":"25","units":"mg"},
      "doseIndicator":null,
      "doseRestriction":null,
      "end_time":null,
      "freeTextSig":null,
      "fulfillmentHistory":[],
      "fulfillmentInstructions":null,
      "health_record_field":null,
      "indication":null,
      "method":null,
      "mood_code":"EVN",
      "negationInd":true,
      "negationReason":{"code_system":"CDC Race","code":"1002-5"},
      "oid":"2.16.840.1.113883.3.560.1.164",
      "patientInstructions":null,
      "productForm":null,
      "reaction":null,
      "reason":null,
      "refills":null,
      "route":{"code_system":"RxNorm","code":"995218","title":"Hydroxyzine"},
      "signed_datetime":null,
      "specifics":null,
      "start_time":1337328000,
      "statusOfMedication":null,
      "status_code":{"HL7 ActStatus":["administered"]},
      "supply":{"scalar":"60","units":"mg"},
      "time":null,
      "typeOfMedication":null,
      "vehicle":null
      }

    it "should return an author DateTime", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered(substanceAdministeredEntry)
      expect(substanceAdministered.authorDatetime()).toEqual new cql.DateTime(2012, 5, 18, 8, 0, 0, 0, 0)

    it "should return null authorDateTime when no is start_time is specified", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered({})
      expect(substanceAdministered.authorDatetime()).toEqual null

    it "should return a dosage quantity", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered(substanceAdministeredEntry)
      expect(substanceAdministered.dosage()).toEqual new cql.Quantity({unit: 'mg', value: '25'})

    it "should return null if no dosage is specified", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered({})
      expect(substanceAdministered.dosage()).toEqual null

    it "should return a frequency code", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered(substanceAdministeredEntry)
      expect(substanceAdministered.frequency()).toEqual new cql.Code('1002293','RxNorm', null, 'Common substances for allergy and intolerance documentation')

    it "should return a frequency code", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered({})
      expect(substanceAdministered.frequency()).toEqual null

    it "should return a negationRationale code", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered(substanceAdministeredEntry)
      expect(substanceAdministered.negationRationale()).toEqual new cql.Code('1002-5','CDC Race', null, null)

    it "should return a negationRationale code", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered({})
      expect(substanceAdministered.negationRationale()).toEqual null

    it "should return a relevantPeriod interval", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered(substanceAdministeredEntry)
      expect(substanceAdministered.relevantPeriod()).toEqual new cql.Interval(new cql.DateTime(2012,5,18,8,0,0,0,0), new cql.DateTime(9999,12,31,23,59,59,999,0))

    it "should return null if no relevantPeriod is specified", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered({})
      expect(substanceAdministered.relevantPeriod()).toEqual null

    it "should return a route code", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered(substanceAdministeredEntry)
      expect(substanceAdministered.route()).toEqual new cql.Code('995218', 'RxNorm', null, 'Hydroxyzine')

    it "should return null if no route is specified", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered({})
      expect(substanceAdministered.route()).toEqual null

    it "should show null relevantPeriod", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered({})
      expect(substanceAdministered.relevantPeriod()).toBeNull()

    it "should show valid relevantPeriod", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(substanceAdministered.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.000+00:00","high":"2017-08-31T02:00:00.000+00:00","lowClosed":true,"highClosed":true}'

    it "should return a coded frequency", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered({'administrationTiming': {code: '1234', code_system: 'SNOMED-CT', version: '', title: 'Test Code'}})
      expect(substanceAdministered.frequency()).toEqual new cql.Code('1234', 'SNOMED-CT', null, 'Test Code')

    it "should return null when field is not on constructing entry", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(substanceAdministered.frequency()).toEqual null
      expect(substanceAdministered.dosage()).toEqual null

  describe "Order", ->
    substanceOrderEntry = {
      "_id":"5aff087b08fa185cd1c70f6d",
      "active_datetime":null,
      "administrationTiming":{"code_system":"RxNorm","code":"1010600","title":"Opioid Pain Medications"},
      "allowedAdministrations":null,
      "anatomical_approach":null,
      "codes":{"NCI Thesaurus":["C26659"]},
      "cumulativeMedicationDuration":null,
      "deliveryMethod":null,
      "description":"Substance, Order: Marijuana",
      "dose":{"scalar":"25","units":"mg"},
      "doseIndicator":null,
      "doseRestriction":null,
      "end_time":null,
      "freeTextSig":null,
      "fulfillmentHistory":[],
      "fulfillmentInstructions":null,
      "health_record_field":null,
      "indication":null,
      "method":{"code_system":"LOINC","code":"29463-7","title":"Body Weight"},
      "mood_code":"EVN",
      "negationInd":true,
      "negationReason":{"code_system":"LOINC","code":"29463-7"},
      "oid":"2.16.840.1.113883.3.560.1.168",
      "patientInstructions":null,
      "productForm":null,
      "reaction":null,
      "reason":{"code_system":"RxNorm","code":"1010600","title":"Opioid Pain Medications"},
      "refills":{"scalar":"10","units":"mg"},
      "route":{"code_system":"RxNorm","code":"1002293","title":"Common substances for allergy and intolerance documentation"},
      "signed_datetime":null,
      "specifics":null,
      "start_time":1337328000,
      "statusOfMedication":null,
      "status_code":{"HL7 ActStatus":["ordered"]},
      "supply":{"scalar":"60","units":"mg"},
      "time":null,
      "typeOfMedication":null,
      "vehicle":null
      }

    it "should return an author DateTime", ->
      substanceOrder = new CQL_QDM.SubstanceOrder(substanceOrderEntry)
      expect(substanceOrder.authorDatetime()).toEqual new cql.DateTime(2012, 5, 18, 8, 0, 0, 0, 0)

    it "should return null authorDateTime when no is start_time is specified", ->
      substanceOrder = new CQL_QDM.SubstanceOrder({})
      expect(substanceOrder.authorDatetime()).toEqual null

    it "should return a dosage quantity", ->
      substanceOrder = new CQL_QDM.SubstanceOrder(substanceOrderEntry)
      expect(substanceOrder.dosage()).toEqual new cql.Quantity({unit: 'mg', value: '25'})

    it "should return null if no dosage is specified", ->
      substanceOrder = new CQL_QDM.SubstanceOrder({})
      expect(substanceOrder.dosage()).toEqual null

    it "should return a frequency code", ->
      substanceOrder = new CQL_QDM.SubstanceOrder(substanceOrderEntry)
      expect(substanceOrder.frequency()).toEqual new cql.Code('1010600','RxNorm', null, 'Opioid Pain Medications')

    it "should return a frequency code", ->
      substanceOrder = new CQL_QDM.SubstanceOrder({})
      expect(substanceOrder.frequency()).toEqual null

    it "should return a method Code", ->
      substanceOrder = new CQL_QDM.SubstanceOrder(substanceOrderEntry)
      expect(substanceOrder.method()).toEqual new cql.Code('29463-7', 'LOINC', null, 'Body Weight')

    it "should return null if no method is specified", ->
       substanceOrder = new CQL_QDM.SubstanceOrder({})
       expect(substanceOrder.method()).toEqual null

    it "should return a negationRationale code", ->
      substanceOrder = new CQL_QDM.SubstanceOrder(substanceOrderEntry)
      expect(substanceOrder.negationRationale()).toEqual new cql.Code('29463-7','LOINC', null, null)

    it "should return a negationRationale code", ->
      substanceOrder = new CQL_QDM.SubstanceOrder({})
      expect(substanceOrder.negationRationale()).toEqual null

    it "should return a reason code", ->
      substanceOrder = new CQL_QDM.SubstanceOrder(substanceOrderEntry)
      expect(substanceOrder.reason()).toEqual new cql.Code('1010600', 'RxNorm', null, 'Opioid Pain Medications')

    it "should return null if no reason is specified", ->
      substanceOrder = new CQL_QDM.SubstanceOrder({})
      expect(substanceOrder.reason()).toEqual null

    it "should a refills scalar", ->
      substanceOrder = new CQL_QDM.SubstanceOrder(substanceOrderEntry)
      expect(substanceOrder.refills()).toEqual '10'

    it "should return null if no refills is specified", ->
      substanceOrder = new CQL_QDM.SubstanceOrder({})
      expect(substanceOrder.refills()).toEqual null

    it "should return a route code", ->
      substanceOrder = new CQL_QDM.SubstanceOrder(substanceOrderEntry)
      expect(substanceOrder.route()).toEqual new cql.Code('1002293', 'RxNorm', null, 'Common substances for allergy and intolerance documentation')

    it "should return null if no route is specified", ->
      substanceOrder = new CQL_QDM.SubstanceOrder({})
      expect(substanceOrder.route()).toEqual null

    it "should return a supply quantity", ->
      substanceOrder = new CQL_QDM.SubstanceOrder(substanceOrderEntry)
      expect(substanceOrder.supply()).toEqual new cql.Quantity(unit: 'mg', value: '60')

    it "should return null if no supply is specified", ->
      substanceOrder = new CQL_QDM.SubstanceOrder({})
      expect(substanceOrder.supply()).toEqual null

    it "should return an integer of the number of refills", ->
      substanceOrder = new CQL_QDM.SubstanceOrder({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM', 'refills': {unit: '', scalar: 5}})
      expect(substanceOrder.refills()).toEqual 5

    it "should return a coded frequency", ->
      substanceOrder = new CQL_QDM.SubstanceOrder({'administrationTiming': {code: '1234', code_system: 'SNOMED-CT', version: '', title: 'Test Code'}})
      expect(substanceOrder.frequency()).toEqual new cql.Code('1234', 'SNOMED-CT', null, 'Test Code')

    it "should return a dosage quantity", ->
      substanceOrder = new CQL_QDM.SubstanceOrder({'dose': {units: 'g', scalar: 10}})
      expect(substanceOrder.dosage()).toEqual new cql.Quantity({unit: 'g', value: 10})

    it "should return null when field is not on constructing entry", ->
      substanceOrder = new CQL_QDM.SubstanceOrder({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(substanceOrder.frequency()).toEqual null
      expect(substanceOrder.refills()).toEqual null
      expect(substanceOrder.supply()).toEqual null
      expect(substanceOrder.dosage()).toEqual null

  describe "Recommended", ->
    substanceRecommendedEntry = {
      "_id":"5aff0e1108fa185cd1c70f98",
      "active_datetime":null,
      "administrationTiming":{"code_system":"SNOMED-CT","code":"10725009","title":"Essential Hypertension"},
      "allowedAdministrations":null,
      "anatomical_approach":null,
      "codes":{},
      "cumulativeMedicationDuration":null,
      "deliveryMethod":null,
      "description":"Substance, Recommended: Substance, Recommended",
      "dose":{"scalar":"50","units":"mg"},
      "doseIndicator":null,
      "doseRestriction":null,
      "end_time":null,
      "freeTextSig":null,
      "fulfillmentHistory":[],
      "fulfillmentInstructions":null,
      "health_record_field":null,
      "indication":null,
      "method":{"code_system":"LOINC","code":"29463-7","title":"Body Weight"},
      "mood_code":"EVN",
      "negationInd":true,
      "negationReason":{"code_system":"CDC Race","code":"1002-5"},
      "oid":"2.16.840.1.113883.3.560.1.193",
      "patientInstructions":null,
      "productForm":null,
      "reaction":null,
      "reason":{"code_system":"RxNorm","code":"995218","title":"Hydroxyzine"},
      "refills":{"scalar":"10","units":""},
      "route":{"code_system":"SNOMED-CT","code":"10725009","title":"Essential Hypertension"},
      "signed_datetime":null,
      "specifics":null,
      "start_time":1337328000,
      "statusOfMedication":null,
      "status_code":{"HL7 ActStatus":["recommended"]},
      "supply":{"scalar":"60","units":"mg"},
      "time":null,
      "typeOfMedication":null,
      "vehicle":null
      }

    it "should return an author DateTime", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended(substanceRecommendedEntry)
      expect(substanceRecommended.authorDatetime()).toEqual new cql.DateTime(2012, 5, 18, 8, 0, 0, 0, 0)

    it "should return null authorDateTime when no is start_time is specified", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended({})
      expect(substanceRecommended.authorDatetime()).toEqual null

    it "should return a dosage quantity", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended(substanceRecommendedEntry)
      expect(substanceRecommended.dosage()).toEqual new cql.Quantity({unit: 'mg', value: '50'})

    it "should return null if no dosage is specified", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended({})
      expect(substanceRecommended.dosage()).toEqual null

    it "should return a frequency code", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended(substanceRecommendedEntry)
      expect(substanceRecommended.frequency()).toEqual new cql.Code('10725009','SNOMED-CT', null, 'Essential Hypertension')

    it "should return a frequency code", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended({})
      expect(substanceRecommended.frequency()).toEqual null

    it "should return a method Code", ->
       substanceRecommended = new CQL_QDM.SubstanceRecommended(substanceRecommendedEntry)
       expect(substanceRecommended.method()).toEqual new cql.Code('29463-7', 'LOINC', null, 'Body Weight')

    it "should return null if no method is specified", ->
       substanceRecommended = new CQL_QDM.SubstanceRecommended({})
       expect(substanceRecommended.method()).toEqual null

    it "should return a negationRationale code", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended(substanceRecommendedEntry)
      expect(substanceRecommended.negationRationale()).toEqual new cql.Code('1002-5','CDC Race', null, null)

    it "should return a negationRationale code", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended({})
      expect(substanceRecommended.negationRationale()).toEqual null

    it "should return a reason code", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended(substanceRecommendedEntry)
      expect(substanceRecommended.reason()).toEqual new cql.Code('995218', 'RxNorm', null, 'Hydroxyzine')

    it "should return null if no reason is specified", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended({})
      expect(substanceRecommended.reason()).toEqual null

    it "should a refills scalar", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended(substanceRecommendedEntry)
      expect(substanceRecommended.refills()).toEqual '10'

    it "should return null if no refills is specified", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended({})
      expect(substanceRecommended.refills()).toEqual null

    it "should return a route code", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended(substanceRecommendedEntry)
      expect(substanceRecommended.route()).toEqual new cql.Code('10725009', 'SNOMED-CT', null, 'Essential Hypertension')

    it "should return null if no route is specified", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended({})
      expect(substanceRecommended.route()).toEqual null

    it "should return an integer of the number of refills", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM', 'refills': {unit: '', scalar: 5}})
      expect(substanceRecommended.refills()).toEqual 5

    it "should return a coded frequency", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended({'administrationTiming': {code: '1234', code_system: 'SNOMED-CT', version: '', title: 'Test Code'}})
      expect(substanceRecommended.frequency()).toEqual new cql.Code('1234', 'SNOMED-CT', null, 'Test Code')

    it "should return a dosage quantity", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended({'dose': {units: 'g', scalar: 10}})
      expect(substanceRecommended.dosage()).toEqual new cql.Quantity({unit: 'g', value: 10})

    it "should return null when field is not on constructing entry", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(substanceRecommended.frequency()).toEqual null
      expect(substanceRecommended.refills()).toEqual null
      expect(substanceRecommended.dosage()).toEqual null
      expect(substanceRecommended.entry.end_time).toEqual undefined
