describe "Substance", ->
  describe "Administered", ->
    it "should show null relevantPeriod", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered({})
      expect(substanceAdministered.relevantPeriod()).toBeNull()

    it "should show valid relevantPeriod", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(substanceAdministered.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"2017-08-31T02:00:00.00+0000","lowClosed":true,"highClosed":true}'

    it "should throw an error if refills() is called", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(substanceAdministered.refills).not.toBeDefined()
      expect(substanceAdministered.frequency).toThrowError('Bonnie does not currently support SubstanceAdministered.frequency')

  describe "Order", ->
    it "should throw an error if refills() is called", ->
      substanceOrder = new CQL_QDM.SubstanceOrder({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(substanceOrder.refills).toThrowError('Bonnie does not currently support SubstanceOrder.refills')
      expect(substanceOrder.frequency).toThrowError('Bonnie does not currently support SubstanceOrder.frequency')

  describe "Recommended", ->
    it "should throw an error if refills() is called", ->
      substanceRecommended = new CQL_QDM.SubstanceRecommended({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(substanceRecommended.refills).toThrowError('Bonnie does not currently support SubstanceRecommended.refills')
      expect(substanceRecommended.frequency).toThrowError('Bonnie does not currently support SubstanceRecommended.frequency')
