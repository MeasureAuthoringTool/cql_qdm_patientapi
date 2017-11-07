describe "Symptom", ->
  describe "Prevalence", ->
    it "should show null prevalencePeriod", ->
      symptom = new CQL_QDM.Symptom({})
      expect(symptom.prevalencePeriod()).toEqual null

    it "should show valid prevalencePeriod", ->
      symptom = new CQL_QDM.Symptom({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(symptom.prevalencePeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"2017-08-31T02:00:00.00+0000","lowClosed":true,"highClosed":true}'

    it "should use infinite date for abatement", ->
      symptom = new CQL_QDM.Symptom({'start_time': '08/31/2017 1:00 AM'})
      expect(JSON.stringify(symptom.prevalencePeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"9999-12-31T23:59:59.99+0000","lowClosed":true,"highClosed":true}'
