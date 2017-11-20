describe "Adverse Event", ->
  it "should show null relevantPeriod", ->
    adverseEvent = new CQL_QDM.AdverseEvent({})
    expect(adverseEvent.relevantPeriod()).toBeNull()

  it "should show valid relevantPeriod", ->
    adverseEvent = new CQL_QDM.AdverseEvent({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
    expect(JSON.stringify(adverseEvent.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.00+0000","high":"2017-08-31T02:00:00.00+0000","lowClosed":true,"highClosed":true}'

  it "should return null for a null type", ->
    adverseEvent = new CQL_QDM.AdverseEvent({})
    expect(adverseEvent.type()).toBeNull()

  it "should show valid type", ->
    adverseEvent = new CQL_QDM.AdverseEvent({'type': {'code': '12345', 'code_system': 'Bar'}})
    expect(JSON.stringify(adverseEvent.type())).toEqual('{"code":"12345","system":"Bar"}')

  it "should return null for a null facility location", ->
    adverseEvent = new CQL_QDM.AdverseEvent({})
    expect(adverseEvent.facilityLocation()).toBeNull()

  it "should show valid facility location", ->
    adverseEvent = new CQL_QDM.AdverseEvent({'facility': {'values': [{'code': {'code': '123456', 'code_system': 'Foo'}, 'display': 'A Facility'}]}})
    expect(JSON.stringify(adverseEvent.facilityLocation())).toEqual('{"_code":{"code":"123456","system":"Foo","display":"A Facility"}}')
