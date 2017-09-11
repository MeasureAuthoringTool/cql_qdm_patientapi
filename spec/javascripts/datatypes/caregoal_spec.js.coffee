describe "CareGoal", ->
  it "should return a list of ids when relatedTo is called", ->
    careGoal = new CQL_QDM.CareGoal({'references': [{'referenced_id':'1234567890', 'type':'Example'},{'referenced_id':'0987654321', 'type':'Example'}]})
    expect(careGoal.relatedTo().length).toBe 2
    referenceId = new CQL_QDM.Id('1234567890')
    relatedToArray = careGoal.relatedTo()
    expect(relatedToArray[0]).toEqual referenceId

  it "should show null relevantPeriod", ->
    careGoal = new CQL_QDM.CareGoal({})
    expect(careGoal.relevantPeriod()).toEqual null

  it "should show valid relevantPeriod", ->
    careGoal = new CQL_QDM.CareGoal({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
    expect(JSON.stringify(careGoal.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"2017-08-31T02:00:00.00+0000","lowClosed":true,"highClosed":true}'
