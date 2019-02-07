describe "Symptom", ->
  describe "Prevalence", ->
    it "should show null prevalencePeriod", ->
      symptom = new CQL_QDM.Symptom({})
      expect(symptom.prevalencePeriod()).toBeNull()

    it "should show valid prevalencePeriod", ->
      symptom = new CQL_QDM.Symptom({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(symptom.prevalencePeriod())).toEqual '{"low":"2017-08-31T01:00:00.000+00:00","high":"2017-08-31T02:00:00.000+00:00","lowClosed":true,"highClosed":true}'

    it "should use null high for abatement", ->
      symptom = new CQL_QDM.Symptom({'start_time': '08/31/2017 1:00 AM'})
      expect(JSON.stringify(symptom.prevalencePeriod())).toEqual '{"low":"2017-08-31T01:00:00.000+00:00","high":null,"lowClosed":true,"highClosed":true}'
