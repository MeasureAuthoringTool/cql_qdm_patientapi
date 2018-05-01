describe "Substance", ->
  describe "Administered", ->
    it "should show null relevantPeriod", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered({})
      expect(substanceAdministered.relevantPeriod()).toBeNull()

    it "should show valid relevantPeriod", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(substanceAdministered.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"2017-08-31T02:00:00.00+0000","lowClosed":true,"highClosed":true}'

    it "should return a coded frequency", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered({'administrationTiming': {code: '1234', code_system: 'SNOMED-CT', version: '', title: 'Test Code'}})
      expect(substanceAdministered.frequency()).toEqual new cql.Code('1234', 'SNOMED-CT', '', 'Test Code')

    it "should return a dosage quantity", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered({'dose': {unit: 'g', scalar: 10}})
      expect(substanceAdministered.dosage()).toEqual new cql.Quantity({unit: 'g', value: 10})

    it "should return null when field is not on constructing entry", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(substanceAdministered.frequency()).toEqual null
      expect(substanceAdministered.supply()).toEqual null
      expect(substanceAdministered.dosage()).toEqual null

  describe "Order", ->
    it "should return an integer of the number or refills", ->
      substanceOrder = new CQL_QDM.SubstanceOrder({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM', 'refills': {unit: '', scalar: 5}})
      expect(substanceOrder.refills()).toEqual 5

    it "should return a coded frequency", ->
      substanceOrder = new CQL_QDM.SubstanceOrder({'administrationTiming': {code: '1234', code_system: 'SNOMED-CT', version: '', title: 'Test Code'}})
      expect(substanceOrder.frequency()).toEqual new cql.Code('1234', 'SNOMED-CT', '', 'Test Code')

    it "should return a dosage quantity", ->
      substanceOrder = new CQL_QDM.SubstanceOrder({'dose': {unit: 'g', scalar: 10}})
      expect(substanceOrder.dosage()).toEqual new cql.Quantity({unit: 'g', value: 10})

    it "should return null when field is not on constructing entry", ->
      substanceOrder = new CQL_QDM.SubstanceOrder({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(substanceOrder.frequency()).toEqual null
      expect(substanceOrder.refills()).toEqual null
      expect(substanceOrder.supply()).toEqual null
      expect(substanceOrder.dosage()).toEqual null

  describe "Recommended", ->
    it "should return an integer of the number or refills", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM', 'refills': {unit: '', scalar: 5}})
      expect(substanceRecommended.refills()).toEqual 5

    it "should return a coded frequency", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended({'administrationTiming': {code: '1234', code_system: 'SNOMED-CT', version: '', title: 'Test Code'}})
      expect(substanceRecommended.frequency()).toEqual new cql.Code('1234', 'SNOMED-CT', '', 'Test Code')

    it "should return a dosage quantity", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended({'dose': {unit: 'g', scalar: 10}})
      expect(substanceRecommended.dosage()).toEqual new cql.Quantity({unit: 'g', value: 10})

    it "should return null when field is not on constructing entry", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(substanceRecommended.frequency()).toEqual null
      expect(substanceRecommended.refills()).toEqual null
      expect(substanceRecommended.supply()).toEqual null
      expect(substanceRecommended.dosage()).toEqual null
