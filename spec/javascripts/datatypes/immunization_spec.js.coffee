describe "Immunization", ->
  describe "Administered", ->
    immunizationAdministeredEntry = {
        "_id":"5afc581e08fa180a0efc7fc8",
        "active_datetime":null,
        "administrationTiming":null,
        "allowedAdministrations":null,
        "anatomical_approach":null,
        "codes":{"CVX":["106"]},
        "cumulativeMedicationDuration":null,
        "deliveryMethod":null,
        "description":"Immunization, Administered: DTaP Vaccine",
        "dose":{"scalar":"23","units":"mg"},
        "doseIndicator":null,
        "doseRestriction":null,
        "end_time":null,
        "freeTextSig":null,
        "fulfillmentInstructions":null,
        "health_record_field":null,
        "indication":null,
        "method":null,
        "mood_code":"EVN",
        "negationInd":true,
        "negationReason":{"code_system":"SNOMED-CT","code":"10082001"},
        "oid":"2.16.840.1.113883.10.20.28.3.112",
        "patientInstructions":null,
        "productForm":null,
        "reaction":null,
        "reason":{"code_system":"CVX","code":"120","title":"Haemophilus Influenzae Type B (HiB) Vaccine"},
        "refills":null,
        "route":{"code_system":"CVX","code":"100","title":"Pneumococcal Conjugate Vaccine"},
        "signed_datetime":null,
        "specifics":null,
        "start_time":1337155200,
        "statusOfMedication":null,
        "status_code":{"HL7 ActStatus":["administered"]},
        "supply":{"scalar":"14","units":"mg"},
        "time":null,
        "typeOfMedication":null,
        "vehicle":null
    } 

    it "should return an author DateTime", ->
      immunizationAdministered = new CQL_QDM.ImmunizationAdministered(immunizationAdministeredEntry)
      expect(immunizationAdministered.authorDatetime()).toEqual new cql.DateTime(2012, 5, 16, 8, 0, 0, 0, 0)

    it "should return null authorDateTime when no is start_time is specified", ->
       immunizationAdministered = new CQL_QDM.ImmunizationAdministered({})
       expect(immunizationAdministered.authorDatetime()).toEqual null

    it "should return a dosage quantity", ->
      immunizationAdministered = new CQL_QDM.ImmunizationAdministered(immunizationAdministeredEntry)
      expect(immunizationAdministered.dosage()).toEqual new cql.Quantity({unit: 'mg', value: '23'})

    it "should return null if no dosage is specified", ->
      immunizationAdministered = new CQL_QDM.ImmunizationAdministered({})
      expect(immunizationAdministered.dosage()).toEqual null

    it "should return a negation rationale code", ->
      immunizationAdministered = new CQL_QDM.ImmunizationAdministered(immunizationAdministeredEntry)
      expect(immunizationAdministered.negationRationale()).toEqual new cql.Code('10082001', 'SNOMED-CT')

    it "should return null if no negation rationale is specified", ->
      immunizationAdministered = new CQL_QDM.ImmunizationAdministered({})
      expect(immunizationAdministered.negationRationale()).toEqual null

    it "should return a reason code", ->
      immunizationAdministered = new CQL_QDM.ImmunizationAdministered(immunizationAdministeredEntry)
      expect(immunizationAdministered.reason()).toEqual new cql.Code('120', 'CVX')

    it "should return null if no reason is specified", ->
      immunizationAdministered = new CQL_QDM.ImmunizationAdministered({})
      expect(immunizationAdministered.reason()).toEqual null

    it "should return a route code", ->
      immunizationAdministered = new CQL_QDM.ImmunizationAdministered(immunizationAdministeredEntry)
      expect(immunizationAdministered.route()).toEqual new cql.Code('100', 'CVX')

    it "should return null if no route is specified", ->
      immunizationAdministered = new CQL_QDM.ImmunizationAdministered({})
      expect(immunizationAdministered.route()).toEqual null

    it "should return a supply quantity", ->
      immunizationAdministered = new CQL_QDM.ImmunizationAdministered(immunizationAdministeredEntry)
      expect(immunizationAdministered.supply()).toEqual new cql.Quantity({unit: 'mg', value: '14'})

    it "should return null if no supply is specified", ->
      immunizationAdministered = new CQL_QDM.ImmunizationAdministered({})
      expect(immunizationAdministered.supply()).toEqual null

  describe "Order", ->
    immunizationOrderedEntry = {
        "_id":"5afc6ef608fa1813ddc09ffe",
        "active_datetime":null,
        "administrationTiming":null,
        "allowedAdministrations":null,
        "anatomical_approach":null,
        "codes":{"CVX":["135"]},
        "cumulativeMedicationDuration":null,
        "deliveryMethod":null,
        "description":"Immunization, Order: Influenza Vaccine",
        "dose":{"scalar":"25","units":"mg"},
        "doseIndicator":null,
        "doseRestriction":null,
        "end_time":null,
        "freeTextSig":null,
        "fulfillmentInstructions":null,
        "health_record_field":null,
        "indication":null,
        "method":null,
        "mood_code":"EVN",
        "negationInd":true,
        "negationReason":{"code_system":"SNOMED-CT","code":"128731000119101"},
        "oid":null,
        "patientInstructions":null,
        "productForm":null,
        "reaction":null,
        "reason":{"code_system":"SNOMED-CT","code":"241935008","title":"Anaphylactic Reaction to Eggs"},
        "refills":null,
        "route":{"code_system":"SNOMED-CT","code":"185900003","title":"IMM2 Previous Receipt of Influenza Vaccine"},
        "signed_datetime":null,
        "specifics":null,
        "start_time":1337155200,
        "statusOfMedication":null,
        "status_code":{"HL7 ActStatus":["ordered"]},
        "supply":{"scalar":"27","units":"mg"},
        "time":null,
        "typeOfMedication":null,
        "vehicle":null
    }
 
    it "should return an active DateTime", ->
      immunizationOrdered = new CQL_QDM.ImmunizationOrder(immunizationOrderedEntry)
      expect(immunizationOrdered.activeDatetime()).toEqual null

    it "should return null if no active datetime is specified", ->
      immunizationOrdered = new CQL_QDM.ImmunizationOrder({})
      expect(immunizationOrdered.activeDatetime()).toEqual null

    it "should return an author DateTime", ->
      immunizationOrdered = new CQL_QDM.ImmunizationOrder(immunizationOrderedEntry)
      expect(immunizationOrdered.authorDatetime()).toEqual new cql.DateTime(2012, 5, 16, 8, 0, 0, 0, 0)

    it "should return null authorDateTime when no is start_time is specified", ->
       immunizationOrdered = new CQL_QDM.ImmunizationOrder({})
       expect(immunizationOrdered.authorDatetime()).toEqual null

    it "should return a dosage quantity", ->
      immunizationOrdered = new CQL_QDM.ImmunizationOrder(immunizationOrderedEntry)
      expect(immunizationOrdered.dosage()).toEqual new cql.Quantity({unit: 'mg', value: '25'})

    it "should return null if no dosage is specified", ->
      immunizationOrdered = new CQL_QDM.ImmunizationOrder({})
      expect(immunizationOrdered.dosage()).toEqual null

    it "should return a negation rationale code", ->
      immunizationOrdered = new CQL_QDM.ImmunizationOrder(immunizationOrderedEntry)
      expect(immunizationOrdered.negationRationale()).toEqual new cql.Code('128731000119101', 'SNOMED-CT')

    it "should return null if no negation rationale is specified", ->
      immunizationOrdered = new CQL_QDM.ImmunizationOrder({})
      expect(immunizationOrdered.negationRationale()).toEqual null

    it "should return a reason code", ->
      immunizationOrdered = new CQL_QDM.ImmunizationOrder(immunizationOrderedEntry)
      expect(immunizationOrdered.reason()).toEqual new cql.Code('241935008', 'SNOMED-CT')

    it "should return null if no reason is specified", ->
      immunizationOrdered = new CQL_QDM.ImmunizationOrder({})
      expect(immunizationOrdered.reason()).toEqual null

    it "should return a route code", ->
      immunizationOrdered = new CQL_QDM.ImmunizationOrder(immunizationOrderedEntry)
      expect(immunizationOrdered.route()).toEqual new cql.Code('185900003', 'SNOMED-CT')

    it "should return null if no route is specified", ->
      immunizationOrdered = new CQL_QDM.ImmunizationOrder({})
      expect(immunizationOrdered.route()).toEqual null

    it "should return a supply quantity", ->
      immunizationOrdered = new CQL_QDM.ImmunizationOrder(immunizationOrderedEntry)
      expect(immunizationOrdered.supply()).toEqual new cql.Quantity({unit: 'mg', value: '27'})

    it "should return null if no supply is specified", ->
      immunizationOrdered = new CQL_QDM.ImmunizationOrder({})
      expect(immunizationOrdered.supply()).toEqual null
