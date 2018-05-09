describe "Encounter", ->
  describe "Performed", ->
    it "should show nothing if there is no facility", ->
      encounterPerformed = new CQL_QDM.EncounterPerformed({})
      expect(JSON.stringify(encounterPerformed.facilityLocations())).toEqual "[]"

    it "should show just the single facilityLocation", ->
      encounterPerformed = new CQL_QDM.EncounterPerformed({'facility': {"type":"COL","values":[{"code":{"code_system":"HCPCS","code":"G0438"},"display":"Annual Wellness Visit","locationPeriodLow":"08/30/2017 1:00 AM","locationPeriodHigh":"08/31/2017 1:00 AM"}]}})
      expect(JSON.stringify(encounterPerformed.facilityLocations())).toEqual '[{"_code":{"code":"G0438","system":"HCPCS","display":"Annual Wellness Visit"},"_locationPeriod":{"low":"2017-08-30T01:00:00.000+00:00","high":"2017-08-31T01:00:00.000+00:00","lowClosed":true,"highClosed":true}}]'

    it "should show two Facilities", ->
      encounterPerformed = new CQL_QDM.EncounterPerformed({'facility': {"type":"COL","values":[{"code":{"code_system":"HCPCS","code":"G0438"},"display":"Annual Wellness Visit","locationPeriodLow":"08/30/2017 1:00 AM","locationPeriodHigh":"08/31/2017 1:00 AM"},{"code":{"code_system":"SNOMED-CT","code":"105401000119101"},"display":"Diabetes","locationPeriodLow":"08/30/2017 1:00 AM","locationPeriodHigh":"08/31/2017 1:00 AM"}]}})
      expect(JSON.stringify(encounterPerformed.facilityLocations())).toEqual '[{"_code":{"code":"G0438","system":"HCPCS","display":"Annual Wellness Visit"},"_locationPeriod":{"low":"2017-08-30T01:00:00.000+00:00","high":"2017-08-31T01:00:00.000+00:00","lowClosed":true,"highClosed":true}},{"_code":{"code":"105401000119101","system":"SNOMED-CT","display":"Diabetes"},"_locationPeriod":{"low":"2017-08-30T01:00:00.000+00:00","high":"2017-08-31T01:00:00.000+00:00","lowClosed":true,"highClosed":true}}]'

    it "should show Facility without locationPeriod if none provided", ->
      encounterPerformed = new CQL_QDM.EncounterPerformed({'facility': {"type":"COL","values":[{"code":{"code_system":"HCPCS","code":"G0438"},"display":"Annual Wellness Visit","locationPeriodLow":null,"locationPeriodHigh":null}]}})
      expect(JSON.stringify(encounterPerformed.facilityLocations())).toEqual '[{"_code":{"code":"G0438","system":"HCPCS","display":"Annual Wellness Visit"}}]'

    it "should show locationPeriod with undefined end date", ->
      encounterPerformed = new CQL_QDM.EncounterPerformed({'facility': {"type":"COL","values":[{"code":{"code_system":"HCPCS","code":"G0438"},"display":"Annual Wellness Visit","locationPeriodLow":"08/30/2017","locationPeriodHigh":null}]}})
      expect(JSON.stringify(encounterPerformed.facilityLocations())).toEqual '[{"_code":{"code":"G0438","system":"HCPCS","display":"Annual Wellness Visit"},"_locationPeriod":{"low":"1970-01-01T00:00:08.000+00:00","lowClosed":true,"highClosed":true}}]'

    it "should show locationPeriod with undefined start date", ->
      encounterPerformed = new CQL_QDM.EncounterPerformed({'facility': {"type":"COL","values":[{"code":{"code_system":"HCPCS","code":"G0438"},"display":"Annual Wellness Visit","locationPeriodLow":null,"locationPeriodHigh":"08/31/2017 8:00 AM"}]}})
      expect(JSON.stringify(encounterPerformed.facilityLocations())).toEqual '[{"_code":{"code":"G0438","system":"HCPCS","display":"Annual Wellness Visit"},"_locationPeriod":{"high":"2017-08-31T08:00:00.000+00:00","lowClosed":true,"highClosed":true}}]'

    it "should show null relevantPeriod", ->
      encounterPerformed = new CQL_QDM.EncounterPerformed({})
      expect(encounterPerformed.relevantPeriod()).toBeNull()

    it "should show valid relevantPeriod", ->
      encounterPerformed = new CQL_QDM.EncounterPerformed({'start_time': '08/31/2017 1:00 AM', 'end_time': '08/31/2017 2:00 AM'})
      expect(JSON.stringify(encounterPerformed.relevantPeriod())).toEqual '{"low":"2017-08-31T01:00:00.000+00:00","high":"2017-08-31T02:00:00.000+00:00","lowClosed":true,"highClosed":true}'

  describe "Order", ->
    it "should return null for a null facility location", ->
      encounterOrder = new CQL_QDM.EncounterOrder({})
      expect(encounterOrder.facilityLocation()).toBeNull()

    it "should show valid facility location", ->
      encounterOrder = new CQL_QDM.EncounterOrder({'facility': {'values': [{'code': {'code': '123456', 'code_system': 'Foo'}, 'display': 'A Facility'}]}})
      expect(JSON.stringify(encounterOrder.facilityLocation())).toEqual('{"_code":{"code":"123456","system":"Foo","display":"A Facility"}}')
