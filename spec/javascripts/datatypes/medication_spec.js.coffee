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
