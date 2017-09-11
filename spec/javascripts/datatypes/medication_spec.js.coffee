describe "Medication", ->
  describe "Dispensed", ->
    it "can be created and simple accessor works", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed({'refills':'5'})
      expect(medicationDispensed.refills()).toBe '5'

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
      expect(medicationDispensed.relevantPeriod()).toEqual null

    it "should show valid relevantPeriod", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(medicationDispensed.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"2017-08-31T02:00:00.00+0000","lowClosed":true,"highClosed":true}'

  describe "Order", ->
    it "can be created and simple accessor works", ->
      medicationOrdered = new CQL_QDM.MedicationOrder({'refills':'2'})
      expect(medicationOrdered.refills()).toBe '2'

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
      expect(medicationOrdered.relevantPeriod()).toEqual null

    it "should show valid relevantPeriod", ->
      medicationOrdered = new CQL_QDM.MedicationOrder({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(medicationOrdered.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"2017-08-31T02:00:00.00+0000","lowClosed":true,"highClosed":true}'

  describe "Active", ->
    it "should show null relevantPeriod", ->
      medicationActive = new CQL_QDM.MedicationActive({})
      expect(medicationActive.relevantPeriod()).toEqual null

    it "should show valid relevantPeriod", ->
      medicationActive = new CQL_QDM.MedicationActive({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(medicationActive.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"2017-08-31T02:00:00.00+0000","lowClosed":true,"highClosed":true}'

  describe "Administered", ->
    it "should show null relevantPeriod", ->
      medicationAdministered = new CQL_QDM.MedicationAdministered({})
      expect(medicationAdministered.relevantPeriod()).toEqual null

    it "should show valid relevantPeriod", ->
      medicationAdministered = new CQL_QDM.MedicationAdministered({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(medicationAdministered.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"2017-08-31T02:00:00.00+0000","lowClosed":true,"highClosed":true}'
