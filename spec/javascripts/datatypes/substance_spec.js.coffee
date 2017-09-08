describe "Substance", ->
  describe "Administered", ->
    it "should show null relevantPeriod", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered({})
      expect(substanceAdministered.relevantPeriod()).toEqual null

    it "should show valid relevantPeriod", ->
      substanceAdministered = new CQL_QDM.SubstanceAdministered({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(substanceAdministered.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"2017-08-31T02:00:00.00+0000","lowClosed":true,"highClosed":true}'
