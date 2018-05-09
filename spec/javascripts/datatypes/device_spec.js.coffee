describe "Device", ->
  describe "Applied", ->
    it "should show null relevantPeriod", ->
      deviceApplied = new CQL_QDM.DeviceApplied({})
      expect(deviceApplied.relevantPeriod()).toBeNull()

    it "should show valid relevantPeriod", ->
      deviceApplied = new CQL_QDM.DeviceApplied({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(deviceApplied.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.000+00:00","high":"2017-08-31T02:00:00.000+00:00","lowClosed":true,"highClosed":true}'

    it "should show null anatomicalApproachSite", ->
      deviceApplied = new CQL_QDM.DeviceApplied({})
      expect(deviceApplied.anatomicalApproachSite()).toBeNull()
  describe "Order", ->
    it "should show a valid reason", ->
      deviceOrder = new CQL_QDM.DeviceOrder({'reason': {'code': 'foo', 'code_system': 'bar'}})
      expect(JSON.stringify(deviceOrder.reason())).toEqual('{"code":"foo","system":"bar"}')
