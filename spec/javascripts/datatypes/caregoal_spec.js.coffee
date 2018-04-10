describe "CareGoal", ->
  careGoalEntry = {
    "_id":"5afef50608fa185ad5e0a8c1",
    "codes":{"LOINC":["29463-7"]},
    "description":"Care Goal: Body Weight",
    "end_time":1337328900,
    "health_record_field":null,
    "mood_code":"EVN",
    "negationInd":null,
    "negationReason":null,
    "oid":"2.16.840.1.113883.3.560.1.9",
    "reason":null,
    "references":[{"_id":"5afef50608fa185ad5e0a8c2","referenced_id":"5afef50608fa185ad5e0a8c3","referenced_type":"Medication","type":"Related To"}],
    "specifics":null,
    "start_time":1337328000,
    "status_code":{"HL7 ActStatus":[null]},
    "targetOutcome":{"scalar":"25","units":"mg"},
    "time":null}

  it "should return a relevantPeriod interval", ->
    careGoal = new CQL_QDM.CareGoal(careGoalEntry)
    expect(careGoal.relevantPeriod()).toEqual new cql.Interval(new cql.DateTime(2012, 5, 18, 8, 0, 0, 0, 0), new cql.DateTime(2012, 5, 18, 8, 15, 0, 0, 0))

  it "should return null if no relevant period is specified", ->
    careGoal = new CQL_QDM.CareGoal({})
    expect(careGoal.relevantPeriod()).toEqual null

  it "should return relatedTo array", ->
    careGoal = new CQL_QDM.CareGoal(careGoalEntry)
    expect(careGoal.relatedTo().length).toBe 1
    referenceId = new CQL_QDM.Id('5afef50608fa185ad5e0a8c3')
    expect(careGoal.relatedTo()[0]).toEqual referenceId

  it "should return an empty array if relatedTo is unused", ->
    careGoal = new CQL_QDM.CareGoal({})
    expect(careGoal.relatedTo()).toEqual []

  it "should return a targetOutcome quantity", ->
    careGoal = new CQL_QDM.CareGoal(careGoalEntry)
    expect(careGoal.targetOutcome()).toEqual new cql.Quantity(unit: 'mg', value: '25')

  it "should return null if no targetOutcome is specified", ->
    careGoal = new CQL_QDM.CareGoal({})
    expect(careGoal.targetOutcome()).toEqual null

  it "should return a list of ids when relatedTo is called", ->
    careGoal = new CQL_QDM.CareGoal({'references': [{'referenced_id':'1234567890', 'type':'Example'},{'referenced_id':'0987654321', 'type':'Example'}]})
    expect(careGoal.relatedTo().length).toBe 2
    referenceId = new CQL_QDM.Id('1234567890', null, 'Example')
    relatedToArray = careGoal.relatedTo()
    expect(relatedToArray[0]).toEqual referenceId

  it "should show null relevantPeriod", ->
    careGoal = new CQL_QDM.CareGoal({})
    expect(careGoal.relevantPeriod()).toBeNull()

  it "should show valid relevantPeriod", ->
    careGoal = new CQL_QDM.CareGoal({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
    expect(JSON.stringify(careGoal.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.000+00:00","high":"2017-08-31T02:00:00.000+00:00","lowClosed":true,"highClosed":true}'

  it "should show not respond to authorDatetime", ->
    careGoal = new CQL_QDM.CareGoal({})
    expect(careGoal.authorDatetime).not.toBeDefined()
