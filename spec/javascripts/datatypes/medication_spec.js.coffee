describe "Medication", ->
  describe "Dispensed", ->
    medicationDispensedEntry ={
      "_id":"5b06a00692d04ea74456b2b9",
      "active_datetime":null,
      "administrationTiming":{"code_system":"LOINC","code":"29463-7","title":"Body Weight"},
      "allowedAdministrations":null,
      "anatomical_approach":null,
      "codes":{"RxNorm":["1010600"]},
      "cumulativeMedicationDuration":null,
      "daysSupplied":{"scalar":"5","units":""},
      "deliveryMethod":null,
      "description":"Medication, Dispensed: Opioid Pain Medications",
      "dispenserIdentifier":{"value":"Dr. Alice","namingSystem":"testSystem"},
      "dose":{"scalar":"100","units":"g"},
      "doseIndicator":null,
      "doseRestriction":null,
      "end_time":1337683600,
      "freeTextSig":null,
      "fulfillmentHistory":[],
      "fulfillmentInstructions":null,
      "health_record_field":{"code_system":"RxNorm","code":"1002293","title":"Common substances for allergy and intolerance documentation"},
      "indication":null,
      "method":null,
      "mood_code":"EVN",
      "negationInd":true,
      "negationReason":{"code_system":"SNOMED-CT","code":"10725009"},
      "oid":"2.16.840.1.113883.3.560.1.108",
      "patientInstructions":null,
      "prescriberIdentifier":{"value":"Dr. Bob","namingSystem":"doctorSystem"},
      "productForm":null,
      "reaction":{"code_system":"LOINC","code":"29463-7","title":"Body Weight"},
      "reason":{"code_system":"RxNorm","code":"995218","title":"Hydroxyzine"},
      "references":[{"_id":"5b06a00692d04ea74456b2ba","referenced_id":"5b06a00692d04ea74456b2b8","referenced_type":"Medication","type":"Related To"}],
      "refills":{"scalar":"3","units":""},
      "route":{"code_system":"LOINC","code":"29463-7","title":"Body Weight"},
      "signed_datetime":null,
      "specifics":null,
      "start_time":1337673600,
      "statusOfMedication":null,
      "status_code":{"HL7 ActStatus":["dispensed"]},
      "supply":{"scalar":"10","units":"g"},
      "time":null,
      "typeOfMedication":null,
      "vehicle":null
    }

    it "has revelantPeriod", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed(medicationDispensedEntry)
      expect(medicationDispensed.relevantPeriod().low).toEqual new cql.DateTime(2012, 5, 22, 8, 0, 0, 0, 0)
      expect(medicationDispensed.relevantPeriod().high).toEqual new cql.DateTime(2012, 5, 22, 10, 46, 40, 0, 0)
  
    it "should return a dispenserIdentifier Id", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed(medicationDispensedEntry)
      expect(medicationDispensed.dispenserId()).toEqual new CQL_QDM.Id("Dr. Alice", "testSystem")
  
    it "has infinite DateTime when no end_time specified", ->
      previous_end_time = medicationDispensedEntry['end_time']
      # Set end_time to null so that end_time is not specified in this test
      medicationDispensedEntry['end_time'] = null
      medicationDispensed = new CQL_QDM.MedicationDispensed(medicationDispensedEntry)
      expect(medicationDispensed.relevantPeriod().low).toEqual new cql.DateTime(2012, 5, 22, 8, 0, 0, 0, 0)
      expect(medicationDispensed.relevantPeriod().high).toEqual CQL_QDM.Helpers.infinityDateTime()
      # Reset end_time in fixture so that other tests arent effected
      medicationDispensedEntry['end_time'] = previous_end_time

    it "should show null relevantPeriod", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed({})
      expect(medicationDispensed.relevantPeriod()).toBeNull()

    it "should return days supplied", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed(medicationDispensedEntry)
      expect(medicationDispensed.daysSupplied()).toEqual 5

    it "should show valid relevantPeriod", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed(medicationDispensedEntry)
      expect(JSON.stringify(medicationDispensed.relevantPeriod())).toEqual '{"low":"2012-05-22T08:00:00.000+00:00","high":"2012-05-22T10:46:40.000+00:00","lowClosed":true,"highClosed":true}'

    it "should return an integer of the number of refills", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed(medicationDispensedEntry)
      expect(medicationDispensed.refills()).toEqual 3

    it "should return a coded frequency", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed(medicationDispensedEntry)
      expect(medicationDispensed.frequency()).toEqual new cql.Code('29463-7', 'LOINC', null, 'Body Weight')

    it "should return a dosage quantity", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed(medicationDispensedEntry)
      expect(medicationDispensed.dosage()).toEqual new cql.Quantity({unit: 'g', value: 100})

    it "should return a negation rationale code", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed(medicationDispensedEntry)
      expect(medicationDispensed.negationRationale()).toEqual new cql.Code('10725009', 'SNOMED-CT', null, null)

    it "should return a prescriberIdentifier Id", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed(medicationDispensedEntry)
      expect(medicationDispensed.prescriberId()).toEqual new CQL_QDM.Id("Dr. Bob", "doctorSystem")

    it "should return a route code", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed(medicationDispensedEntry)
      expect(medicationDispensed.route()).toEqual new cql.Code('29463-7', 'LOINC', null, 'Body Weight')

    it "should return a supply quantity", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed(medicationDispensedEntry)
      expect(medicationDispensed.supply()).toEqual new cql.Quantity({unit: 'g', value: '10'})

    it "should return null when field is not on constructing entry", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(medicationDispensed.frequency()).toEqual null
      expect(medicationDispensed.refills()).toEqual null
      expect(medicationDispensed.supply()).toEqual null
      expect(medicationDispensed.dosage()).toEqual null
      expect(medicationDispensed.route()).toEqual null
      expect(medicationDispensed.negationRationale()).toEqual null
      expect(medicationDispensed.prescriberId()).toEqual null
      expect(medicationDispensed.dispenserId()).toEqual null
      expect(medicationDispensed.daysSupplied()).toEqual null

  describe "Order", ->
    medicationOrderEntry = {
      "_id":"5b06bb4d92d04ea74456b327",
      "active_datetime":null,
      "administrationTiming":{"code_system":"RxNorm","code":"1002293","title":"Common substances for allergy and intolerance documentation"},
      "allowedAdministrations":null,
      "anatomical_approach":null,
      "codes":{"RxNorm":["1010600"]},
      "cumulativeMedicationDuration":null,
      "daysSupplied":{"scalar":"5","units":""},
      "deliveryMethod":null,
      "description":"Medication, Order: Opioid Pain Medications",
      "dose":{"scalar":"100","units":"mg"},
      "doseIndicator":null,
      "doseRestriction":null,
      "end_time":1337846400,
      "freeTextSig":null,
      "fulfillmentHistory":[],
      "fulfillmentInstructions":null,
      "health_record_field":{"code_system":"LOINC","code":"29463-7","title":"Body Weight"},
      "indication":null,
      "method":null,
      "mood_code":"EVN",
      "negationInd":true,
      "negationReason":{"code_system":"RxNorm","code":"1002293"},
      "oid":"2.16.840.1.113883.3.560.1.78",
      "patientInstructions":null,
      "prescriberIdentifier":{"value":"Dr. Bob","namingSystem":"doctorSystem"},
      "productForm":null,
      "reaction":{"code_system":"LOINC","code":"29463-7","title":"Body Weight"},
      "reason":{"code_system":"RxNorm","code":"995218","title":"Hydroxyzine"},
      "refills":{"scalar":"33","units":""},
      "route":{"code_system":"LOINC","code":"29463-7","title":"Body Weight"},
      "signed_datetime":null,
      "setting":{"code_system":"LOINC","code":"29463-7","title":"Body Weight"},
      "specifics":null,
      "start_time":1337846400,
      "statusOfMedication":null,
      "status_code":{"HL7 ActStatus":["ordered"]},
      "supply":{"scalar":"10","units":"mg"},
      "time":null,
      "typeOfMedication":null,
      "vehicle":null
    }

    it "has revelantPeriod", ->
      medicationOrdered = new CQL_QDM.MedicationOrder(medicationOrderEntry)
      expect(medicationOrdered.relevantPeriod().low).toEqual new cql.DateTime(2012, 5, 24, 8, 0, 0, 0, 0)
      expect(medicationOrdered.relevantPeriod().high).toEqual new cql.DateTime(2012, 5, 24, 8, 0, 0, 0, 0)

    it "has infinite DateTime when no end_time specified", ->
      previous_end_time = medicationOrderEntry['end_time']
      # Set end_time to null so that end_time is not specified in this test
      medicationOrderEntry['end_time'] = null
      medicationOrdered = new CQL_QDM.MedicationOrder(medicationOrderEntry)
      expect(medicationOrdered.relevantPeriod().low).toEqual new cql.DateTime(2012, 5, 24, 8, 0, 0, 0, 0)
      expect(medicationOrdered.relevantPeriod().high).toEqual CQL_QDM.Helpers.infinityDateTime()
      # Reset end_time in fixture so that other tests arent effected
      medicationOrderEntry['end_time'] = previous_end_time

    it "should show null relevantPeriod", ->
      medicationOrdered = new CQL_QDM.MedicationOrder({})
      expect(medicationOrdered.relevantPeriod()).toBeNull()

    it "should return days supplied", ->
      medicationDispensed = new CQL_QDM.MedicationOrder(medicationOrderEntry)
      expect(medicationDispensed.daysSupplied()).toEqual 5

    it "should show valid relevantPeriod", ->
      medicationOrdered = new CQL_QDM.MedicationOrder(medicationOrderEntry)
      expect(JSON.stringify(medicationOrdered.relevantPeriod())).toEqual '{"low":"2012-05-24T08:00:00.000+00:00","high":"2012-05-24T08:00:00.000+00:00","lowClosed":true,"highClosed":true}'

    it "should return an integer of the number of refills", ->
      medicationOrdered = new CQL_QDM.MedicationOrder(medicationOrderEntry)
      expect(medicationOrdered.refills()).toEqual 33

    it "should return a coded frequency", ->
      medicationOrdered = new CQL_QDM.MedicationOrder(medicationOrderEntry)
      expect(medicationOrdered.frequency()).toEqual new cql.Code('1002293', 'RxNorm', null, 'Common substances for allergy and intolerance documentation')

    it "should return a dosage quantity", ->
      medicationOrdered = new CQL_QDM.MedicationOrder(medicationOrderEntry)
      expect(medicationOrdered.dosage()).toEqual new cql.Quantity({unit: 'mg', value: 100})

    it "should return a negation rationale code", ->
      medicationOrdered = new CQL_QDM.MedicationOrder(medicationOrderEntry)
      expect(medicationOrdered.negationRationale()).toEqual new cql.Code('1002293', 'RxNorm', null, null)

    it "should return a route code", ->
      medicationOrdered = new CQL_QDM.MedicationOrder(medicationOrderEntry)
      expect(medicationOrdered.route()).toEqual new cql.Code('29463-7', 'LOINC', null, 'Body Weight')

    it "should return a supply quantity", ->
      medicationOrdered = new CQL_QDM.MedicationOrder(medicationOrderEntry)
      expect(medicationOrdered.supply()).toEqual new cql.Quantity({unit: 'mg', value: '10'})

    it "should return a setting code", ->
      medicationOrdered = new CQL_QDM.MedicationOrder(medicationOrderEntry)
      expect(medicationOrdered.setting()).toEqual new cql.Code('29463-7', 'LOINC', null, 'Body Weight')

    it "should return a prescriberIdentifier Id", ->
      medicationOrdered = new CQL_QDM.MedicationOrder(medicationOrderEntry)
      expect(medicationOrdered.prescriberId()).toEqual new CQL_QDM.Id("Dr. Bob", "doctorSystem")

    it "should return null when field is not on constructing entry", ->
      medicationOrdered = new CQL_QDM.MedicationOrder({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(medicationOrdered.frequency()).toEqual null
      expect(medicationOrdered.refills()).toEqual null
      expect(medicationOrdered.supply()).toEqual null
      expect(medicationOrdered.dosage()).toEqual null
      expect(medicationOrdered.route()).toEqual null
      expect(medicationOrdered.negationRationale()).toEqual null
      expect(medicationOrdered.setting()).toEqual null
      expect(medicationOrdered.prescriberId()).toEqual null
      expect(medicationOrdered.daysSupplied()).toEqual null

  describe "Active", ->
    medicationActiveEntry = {
      "_id":"5b06cc2592d04ea74456b38f",
      "active_datetime":null,
      "administrationTiming":{"code_system":"RxNorm","code":"1002293","title":"Common substances for allergy and intolerance documentation"},
      "allowedAdministrations":null,
      "anatomical_approach":null,
      "codes":{"RxNorm":["995218"]},
      "cumulativeMedicationDuration":null,
      "deliveryMethod":null,
      "description":"Medication, Active: Hydroxyzine",
      "dose":{"scalar":"12","units":"mg"},
      "doseIndicator":null,
      "doseRestriction":null,
      "end_time":1337847300,
      "freeTextSig":null,
      "fulfillmentHistory":[],
      "fulfillmentInstructions":null,
      "health_record_field":{"code_system":"RxNorm","code":"1002293","title":"Common substances for allergy and intolerance documentation"},
      "indication":null,
      "method":null,
      "mood_code":"EVN",
      "negationInd":null,
      "negationReason":null,
      "oid":"2.16.840.1.113883.3.560.1.13",
      "patientInstructions":null,
      "productForm":null,
      "reaction":{"code_system":"LOINC","code":"29463-7","title":"Body Weight"},
      "reason":{"code_system":"CDC Race","code":"2135-2","title":"Ethnicity"},
      "refills":null,
      "route":{"code_system":"RxNorm","code":"995218","title":"Hydroxyzine"},
      "signed_datetime":null,
      "specifics":null,
      "start_time":1337846400,
      "statusOfMedication":null,
      "status_code":{"SNOMED-CT":["55561003"],"HL7 ActStatus":["active"]},
      "supply":{"scalar":"1000","units":"g"},
      "time":null,
      "typeOfMedication":null,
      "vehicle":null
    }

    it "should show null relevantPeriod", ->
      medicationActive = new CQL_QDM.MedicationActive({})
      expect(medicationActive.relevantPeriod()).toBeNull()

    it "should show valid relevantPeriod", ->
      medicationActive = new CQL_QDM.MedicationActive(medicationActiveEntry)
      expect(JSON.stringify(medicationActive.relevantPeriod())).toEqual '{"low":"2012-05-24T08:00:00.000+00:00","high":"2012-05-24T08:15:00.000+00:00","lowClosed":true,"highClosed":true}'

    it "should return a coded frequency", ->
      medicationActive = new CQL_QDM.MedicationActive(medicationActiveEntry)
      expect(medicationActive.frequency()).toEqual new cql.Code('1002293', 'RxNorm', null, 'Common substances for allergy and intolerance documentation')

    it "should return a dosage quantity", ->
      medicationActive = new CQL_QDM.MedicationActive(medicationActiveEntry)
      expect(medicationActive.dosage()).toEqual new cql.Quantity({unit: 'mg', value: 12})

    it "should return a route code", ->
      medicationActive = new CQL_QDM.MedicationActive(medicationActiveEntry)
      expect(medicationActive.route()).toEqual new cql.Code('995218', 'RxNorm', null, 'Hydroxyzine')

    it "should return null when field is not on constructing entry", ->
      medicationActive = new CQL_QDM.MedicationActive({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(medicationActive.frequency()).toEqual null
      expect(medicationActive.dosage()).toEqual null

  describe "Administered", ->
    medicationAdministeredEntry ={
      "_id":"5b046c2a92d04e9509d6c303",
      "active_datetime":null,
      "administrationTiming":{"code_system":"RxNorm","code":"1002293", "title":"Common substances for allergy and intolerance documentation"},
      "allowedAdministrations":null,
      "anatomical_approach":null,
      "codes":{"RxNorm":["1010600"]},
      "cumulativeMedicationDuration":null,
      "deliveryMethod":null,
      "description":"Medication, Administered: Opioid Pain Medications",
      "dose":{"scalar":"10","units":"g"},
      "doseIndicator":null,
      "doseRestriction":null,
      "end_time":1337674500,
      "freeTextSig":null,
      "fulfillmentHistory":[],
      "fulfillmentInstructions":null,
      "health_record_field":{"code_system":"RxNorm","code":"1010600","title":"Opioid Pain Medications"},
      "indication":null,
      "method":null,
      "mood_code":"EVN",
      "negationInd":true,
      "negationReason":{"code_system":"SNOMED-CT","code":"10725009"},
      "oid":"2.16.840.1.113883.3.560.1.14",
      "patientInstructions":null,
      "productForm":null,
      "reaction":{"code_system":"LOINC","code":"29463-7","title":"Body Weight"},
      "reason":{"code_system":"SNOMED-CT","code":"10725009","title":"Essential Hypertension"},
      "references":[{"_id":"5b046c8392d04e9509d6c306","referenced_id":"5b046c8392d04e9509d6c307",
      "referenced_type":"Medication","type":"Related To"}],
      "refills":{"scalar":"3","units":""},
      "route":{"code_system":"RxNorm","code":"1002293","title":"Common substances for allergy and intolerance documentation"},
      "signed_datetime":null,
      "specifics":null,
      "start_time":1337673600,
      "statusOfMedication":null,
      "status_code":{"HL7 ActStatus":["administered"]},
      "supply":{"scalar":"44","units":"mg"},
      "time":null,
      "typeOfMedication":null,
      "vehicle":null
    }

    it "should show null relevantPeriod", ->
      medicationAdministered = new CQL_QDM.MedicationAdministered({})
      expect(medicationAdministered.relevantPeriod()).toBeNull()

    it "should show valid relevantPeriod", ->
      medicationAdministered = new CQL_QDM.MedicationAdministered(medicationAdministeredEntry)
      expect(JSON.stringify(medicationAdministered.relevantPeriod())).toEqual '{"low":"2012-05-22T08:00:00.000+00:00","high":"2012-05-22T08:15:00.000+00:00","lowClosed":true,"highClosed":true}'

    it "should return a coded frequency", ->
      medicationAdministered = new CQL_QDM.MedicationAdministered(medicationAdministeredEntry)
      expect(medicationAdministered.frequency()).toEqual new cql.Code('1002293', 'RxNorm', null, 'Common substances for allergy and intolerance documentation')

    it "should return a dosage quantity", ->
      medicationAdministered = new CQL_QDM.MedicationAdministered(medicationAdministeredEntry)
      expect(medicationAdministered.dosage()).toEqual new cql.Quantity({unit: 'g', value: 10})

    it "should return a negation rationale code", ->
      medicationAdministered = new CQL_QDM.MedicationAdministered(medicationAdministeredEntry)
      expect(medicationAdministered.negationRationale()).toEqual new cql.Code('10725009', 'SNOMED-CT', null, null)

    it "should return a reason code", ->
      medicationAdministered = new CQL_QDM.MedicationAdministered(medicationAdministeredEntry)
      expect(medicationAdministered.reason()).toEqual new cql.Code('10725009', 'SNOMED-CT', null, 'Essential Hypertension')

    it "should return a route code", ->
      medicationAdministered = new CQL_QDM.MedicationAdministered(medicationAdministeredEntry)
      expect(medicationAdministered.route()).toEqual new cql.Code('1002293', 'RxNorm', null, 'Common substances for allergy and intolerance documentation')

    it "should return null when field is not on constructing entry", ->
      medicationAdministered = new CQL_QDM.MedicationAdministered({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(medicationAdministered.frequency()).toEqual null
      expect(medicationAdministered.dosage()).toEqual null
      expect(medicationAdministered.route()).toEqual null
      expect(medicationAdministered.reason()).toEqual null
      expect(medicationAdministered.negationRationale()).toEqual null

  describe "Discharge", ->
    medicationDischargeEntry = {
      "_id":"5b06cf4892d04ea74456b3d7",
      "active_datetime":null,
      "administrationTiming":{"code_system":"SNOMED-CT","code":"10725009","title":"Essential Hypertension"},
      "allowedAdministrations":null,
      "anatomical_approach":null,
      "codes":{"RxNorm":["1010600"]},
      "cumulativeMedicationDuration":null,
      "daysSupplied":{"scalar":"5","units":""},
      "deliveryMethod":null,
      "description":"Medication, Discharge: Opioid Pain Medications",
      "dose":{"scalar":"100","units":"mg"},
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
      "negationReason":{"code_system":"LOINC","code":"29463-7"},
      "oid":"2.16.840.1.113883.3.560.1.200",
      "patientInstructions":null,
      "prescriberIdentifier":{"value":"Dr. Bob","namingSystem":"doctorSystem"},
      "productForm":null,
      "reaction":null,
      "reason":null,
      "refills":{"scalar":"100","units":""},
      "route":{"code_system":"RxNorm","code":"995218","title":"Hydroxyzine"},
      "signed_datetime":null,
      "specifics":null,
      "start_time":1337846400,
      "statusOfMedication":null,
      "status_code":{"HL7 ActStatus":["discharge"]},
      "supply":{"scalar":"100","units":"mg"},
      "time":null,
      "typeOfMedication":null,
      "vehicle":null
    }
    it "should return a coded frequency", ->
      medicationDischarge = new CQL_QDM.MedicationDischarge(medicationDischargeEntry)
      expect(medicationDischarge.frequency()).toEqual new cql.Code('10725009', 'SNOMED-CT', null, 'Essential Hypertension')

    it "should return an integer of the number of refills", ->
      medicationDischarge = new CQL_QDM.MedicationDischarge(medicationDischargeEntry)
      expect(medicationDischarge.refills()).toEqual 100

    it "should return days supplied", ->
      medicationDispensed = new CQL_QDM.MedicationDischarge(medicationDischargeEntry)
      expect(medicationDispensed.daysSupplied()).toEqual 5
      
    it "should return a dosage quantity", ->
      medicationDischarge = new CQL_QDM.MedicationDischarge(medicationDischargeEntry)
      expect(medicationDischarge.dosage()).toEqual new cql.Quantity({unit: 'mg', value: 100})

    it "should return a negation rationale code", ->
      medicationDischarge = new CQL_QDM.MedicationDischarge(medicationDischargeEntry)
      expect(medicationDischarge.negationRationale()).toEqual new cql.Code('29463-7', 'LOINC', null, null)

    it "should return a prescriberIdentifier Id", ->
      medicationDischarge = new CQL_QDM.MedicationDischarge(medicationDischargeEntry)
      expect(medicationDischarge.prescriberId()).toEqual new CQL_QDM.Id("Dr. Bob", "doctorSystem")

    it "should return a route code", ->
      medicationDischarge = new CQL_QDM.MedicationDischarge(medicationDischargeEntry)
      expect(medicationDischarge.route()).toEqual new cql.Code('995218', 'RxNorm', null, 'Hydroxyzine')

    it "should return an integer of the number of refills", ->
      medicationDispensed = new CQL_QDM.MedicationDischarge(medicationDischargeEntry)
      expect(medicationDispensed.refills()).toEqual 100

    it "should return a supply quantity", ->
      medicationDispensed = new CQL_QDM.MedicationDischarge(medicationDischargeEntry)
      expect(medicationDispensed.supply()).toEqual new cql.Quantity({unit: 'mg', value: '100'})

    it "should return null when field is not on constructing entry", ->
      medicationDischarge = new CQL_QDM.MedicationDischarge({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(medicationDischarge.frequency()).toEqual null
      expect(medicationDischarge.supply()).toEqual null
      expect(medicationDischarge.dosage()).toEqual null
      expect(medicationDischarge.refills()).toEqual null
      expect(medicationDischarge.route()).toEqual null
      expect(medicationDischarge.negationRationale()).toEqual null
<<<<<<< HEAD
      expect(medicationDischarge.prescriberId()).toEqual null
=======
      expect(medicationDischarge.daysSupplied()).toEqual null
>>>>>>> added days supplied to medication
