describe "Medication", ->
  describe "Dispensed", ->
    it "can be created and simple accessor works", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed({'supply': {unit: 'g', value: 5}})
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

    it "should throw an error if refills() or frequency() is called", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(medicationDispensed.refills).toThrowError('Bonnie does not currently support MedicationDispensed.refills')
      expect(medicationDispensed.frequency).toThrowError('Bonnie does not currently support MedicationDispensed.frequency')


  describe "Order", ->
    it "can be created and simple accessor works", ->
      medicationOrdered = new CQL_QDM.MedicationOrder({'supply': {unit: 'g', value: 5}})
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

    it "should throw an error if refills() or frequency() is called", ->
      medicationOrdered = new CQL_QDM.MedicationOrder({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(medicationOrdered.refills).toThrowError('Bonnie does not currently support MedicationOrder.refills')
      expect(medicationOrdered.frequency).toThrowError('Bonnie does not currently support MedicationOrder.frequency')

  describe "Active", ->
    it "should show null relevantPeriod", ->
      medicationActive = new CQL_QDM.MedicationActive({})
      expect(medicationActive.relevantPeriod()).toBeNull()

    it "should show valid relevantPeriod", ->
      medicationActive = new CQL_QDM.MedicationActive({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(medicationActive.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"2017-08-31T02:00:00.00+0000","lowClosed":true,"highClosed":true}'

  describe "Administered", ->
    it "should show null relevantPeriod", ->
      medicationAdministered = new CQL_QDM.MedicationAdministered({})
      expect(medicationAdministered.relevantPeriod()).toBeNull()

    it "should show valid relevantPeriod", ->
      medicationAdministered = new CQL_QDM.MedicationAdministered({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(medicationAdministered.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"2017-08-31T02:00:00.00+0000","lowClosed":true,"highClosed":true}'

    it "should not support refills()", ->
      # MedicationAdministered does not support refills, according to the model info file
      medicationAdministered = new CQL_QDM.MedicationAdministered({'refills': 2})
      expect(medicationAdministered.refills).not.toBeDefined()

    it "should throw an error if frequency() is called", ->
      medicationAdministered = new CQL_QDM.MedicationAdministered({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(medicationAdministered.frequency).toThrowError('Bonnie does not currently support MedicationAdministered.frequency')

  describe "Discharge", ->
    it "should throw an error if refills() or frequency() is called", ->
      medicationDischarge = new CQL_QDM.MedicationDischarge({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(medicationDischarge.refills).toThrowError('Bonnie does not currently support MedicationDischarge.refills')
      expect(medicationDischarge.frequency).toThrowError('Bonnie does not currently support MedicationDischarge.frequency')
