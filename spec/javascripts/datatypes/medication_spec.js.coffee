describe "Medication", ->
  describe "Dispensed", ->
    it "can be created and simple accessor works", ->
      medicationDispensed = new CQL_QDM.MedicationDispensed({'refills':'5'})
      expect(medicationDispensed.refills()).toBe '5'
