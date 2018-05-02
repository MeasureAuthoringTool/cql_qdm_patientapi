describe "Medication", ->
  describe "Dispensed", ->
    it "can be created and simple accessor works", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed({'supply': {unit: 'g', scalar: 5}})
      expect(medicationDispensed.supply()).toEqual new cql.Quantity({unit: 'g', value: 5})

    it "has revelantPeriod", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed({'start_time':'03/17/2012 10:17 AM', 'end_time':'03/17/2012 10:32 AM'})
      expect(medicationDispensed.relevantPeriod().low).toEqual new cql.DateTime(2012, 3, 17, 10, 17, 0, 0, 0)
      expect(medicationDispensed.relevantPeriod().high).toEqual new cql.DateTime(2012, 3, 17, 10, 32, 0, 0, 0)

    it "has infinite DateTime when no end_time specified", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed({'start_time':'03/17/2012 10:17 AM'})
      expect(medicationDispensed.relevantPeriod().low).toEqual new cql.DateTime(2012, 3, 17, 10, 17, 0, 0, 0)
      expect(medicationDispensed.relevantPeriod().high).toEqual CQL_QDM.Helpers.infinityDateTime()

    it "should show null relevantPeriod", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed({})
      expect(medicationDispensed.relevantPeriod()).toBeNull()

    it "should show valid relevantPeriod", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(medicationDispensed.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"2017-08-31T02:00:00.00+0000","lowClosed":true,"highClosed":true}'

    it "should return an integer of the number of refills", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM', 'refills': {unit: '', scalar: 5}})
      expect(medicationDispensed.refills()).toEqual 5

    it "should return a coded frequency", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed({'administrationTiming': {code: '1234', code_system: 'SNOMED-CT', version: '', title: 'Test Code'}})
      expect(medicationDispensed.frequency()).toEqual new cql.Code('1234', 'SNOMED-CT', '', 'Test Code')

    it "should return a dosage quantity", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed({'dose': {unit: 'g', scalar: 10}})
      expect(medicationDispensed.dosage()).toEqual new cql.Quantity({unit: 'g', value: 10})

    it "should return null when field is not on constructing entry", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(medicationDispensed.frequency()).toEqual null
      expect(medicationDispensed.refills()).toEqual null
      expect(medicationDispensed.supply()).toEqual null
      expect(medicationDispensed.dosage()).toEqual null


  describe "Order", ->
    it "can be created and simple accessor works", ->
      medicationOrdered = new CQL_QDM.MedicationOrder({'supply': {unit: 'g', scalar: 5}})
      expect(medicationOrdered.supply()).toEqual new cql.Quantity({unit: 'g', value: 5})

    it "has revelantPeriod", ->
      medicationOrdered = new CQL_QDM.MedicationOrder({'start_time':'02/21/2012 03:03 AM', 'end_time':'02/22/2012 05:00 PM'})
      expect(medicationOrdered.relevantPeriod().low).toEqual new cql.DateTime(2012, 2, 21, 3, 3, 0, 0, 0)
      expect(medicationOrdered.relevantPeriod().high).toEqual new cql.DateTime(2012, 2, 22, 17, 0, 0, 0, 0)

    it "has infinite DateTime when no end_time specified", ->
      medicationOrdered = new CQL_QDM.MedicationOrder({'start_time':'02/21/2012 03:03 AM'})
      expect(medicationOrdered.relevantPeriod().low).toEqual new cql.DateTime(2012, 2, 21, 3, 3, 0, 0, 0)
      expect(medicationOrdered.relevantPeriod().high).toEqual CQL_QDM.Helpers.infinityDateTime()

    it "should show null relevantPeriod", ->
      medicationOrdered = new CQL_QDM.MedicationOrder({})
      expect(medicationOrdered.relevantPeriod()).toBeNull()

    it "should show valid relevantPeriod", ->
      medicationOrdered = new CQL_QDM.MedicationOrder({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(medicationOrdered.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"2017-08-31T02:00:00.00+0000","lowClosed":true,"highClosed":true}'

    it "should return an integer of the number of refills", ->
      medicationOrdered = new CQL_QDM.MedicationOrder({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM', 'refills': {unit: '', scalar: 5}})
      expect(medicationOrdered.refills()).toEqual 5

    it "should return a coded frequency", ->
      medicationOrdered = new CQL_QDM.MedicationOrder({'administrationTiming': {code: '1234', code_system: 'SNOMED-CT', version: '', title: 'Test Code'}})
      expect(medicationOrdered.frequency()).toEqual new cql.Code('1234', 'SNOMED-CT', '', 'Test Code')

    it "should return a dosage quantity", ->
      medicationOrdered = new CQL_QDM.MedicationOrder({'dose': {unit: 'g', scalar: 10}})
      expect(medicationOrdered.dosage()).toEqual new cql.Quantity({unit: 'g', value: 10})

    it "should return null when field is not on constructing entry", ->
      medicationOrdered = new CQL_QDM.MedicationOrder({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(medicationOrdered.frequency()).toEqual null
      expect(medicationOrdered.refills()).toEqual null
      expect(medicationOrdered.supply()).toEqual null
      expect(medicationOrdered.dosage()).toEqual null

  describe "Active", ->
    it "should show null relevantPeriod", ->
      medicationActive = new CQL_QDM.MedicationActive({})
      expect(medicationActive.relevantPeriod()).toBeNull()

    it "should show valid relevantPeriod", ->
      medicationActive = new CQL_QDM.MedicationActive({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(medicationActive.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"2017-08-31T02:00:00.00+0000","lowClosed":true,"highClosed":true}'

    it "should return null when field is not on constructing entry", ->
      medicationActive = new CQL_QDM.MedicationActive({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(medicationActive.frequency()).toEqual null
      expect(medicationActive.dosage()).toEqual null
      expect(medicationActive.supply()).toEqual null
      
    it "should return a coded frequency", ->
      medicationActive = new CQL_QDM.MedicationActive({'administrationTiming': {code: '1234', code_system: 'SNOMED-CT', version: '', title: 'Test Code'}})
      expect(medicationActive.frequency()).toEqual new cql.Code('1234', 'SNOMED-CT', '', 'Test Code')
      
    it "should return a dosage quantity", ->
      medicationActive = new CQL_QDM.MedicationActive({'dose': {unit: 'g', scalar: 10}})
      expect(medicationActive.dosage()).toEqual new cql.Quantity({unit: 'g', value: 10})

  describe "Administered", ->
    it "should show null relevantPeriod", ->
      medicationAdministered = new CQL_QDM.MedicationAdministered({})
      expect(medicationAdministered.relevantPeriod()).toBeNull()

    it "should show valid relevantPeriod", ->
      medicationAdministered = new CQL_QDM.MedicationAdministered({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(medicationAdministered.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"2017-08-31T02:00:00.00+0000","lowClosed":true,"highClosed":true}'

    it "should return a coded frequency", ->
      medicationAdministered = new CQL_QDM.MedicationAdministered({'administrationTiming': {code: '1234', code_system: 'SNOMED-CT', version: '', title: 'Test Code'}})
      expect(medicationAdministered.frequency()).toEqual new cql.Code('1234', 'SNOMED-CT', '', 'Test Code')

    it "should return a dosage quantity", ->
      medicationAdministered = new CQL_QDM.MedicationAdministered({'dose': {unit: 'g', scalar: 10}})
      expect(medicationAdministered.dosage()).toEqual new cql.Quantity({unit: 'g', value: 10})

    it "should return null when field is not on constructing entry", ->
      medicationAdministered = new CQL_QDM.MedicationAdministered({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(medicationAdministered.frequency()).toEqual null
      expect(medicationAdministered.supply()).toEqual null
      expect(medicationAdministered.dosage()).toEqual null

  describe "Discharge", ->
    it "should return a coded frequency", ->
      medicationDischarge = new CQL_QDM.MedicationDischarge({'administrationTiming': {code: '1234', code_system: 'SNOMED-CT', version: '', title: 'Test Code'}})
      expect(medicationDischarge.frequency()).toEqual new cql.Code('1234', 'SNOMED-CT', '', 'Test Code')

    it "should return an integer of the number of refills", ->
      medicationDischarge = new CQL_QDM.MedicationDispensed({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM', 'refills': {unit: '', scalar: 5}})
      expect(medicationDischarge.refills()).toEqual 5
      
    it "should return a dosage quantity", ->
      medicationDischarge = new CQL_QDM.MedicationDispensed({'dose': {unit: 'g', scalar: 10}})
      expect(medicationDischarge.dosage()).toEqual new cql.Quantity({unit: 'g', value: 10})

    it "should return null when field is not on constructing entry", ->
      medicationDischarge = new CQL_QDM.MedicationDischarge({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(medicationDischarge.frequency()).toEqual null
      expect(medicationDischarge.supply()).toEqual null
      expect(medicationDischarge.dosage()).toEqual null
      expect(medicationDischarge.refills()).toEqual null
