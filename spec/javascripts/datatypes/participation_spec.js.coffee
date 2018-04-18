describe "Participation", ->
  describe "Participation", ->
    it "should show null participationPeriod", ->
      participation = new CQL_QDM.Participation({})
      expect(participation.participationPeriod()).toBeNull()

    it "should show valid participationPeriod", ->
      participation = new CQL_QDM.Participation({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(participation.participationPeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"2017-08-31T02:00:00.00+0000","lowClosed":true,"highClosed":true}'

    it "should use infinite date for abatement", ->
      participation = new CQL_QDM.Participation({'start_time': '08/31/2017 1:00 AM'})
      expect(JSON.stringify(participation.participationPeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"9999-12-31T23:59:59.99+0000","lowClosed":true,"highClosed":true}'
