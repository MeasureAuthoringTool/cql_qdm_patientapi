describe "Assessment", ->
  describe "Performed", ->
    it "should return a list of ids when relatedTo is called", ->
      assessmentPerformed = new CQL_QDM.AssessmentPerformed({'references': [{'referenced_id':'1234567890', 'type':'Example'},{'referenced_id':'0987654321', 'type':'Example'}]})
      expect(assessmentPerformed.relatedTo().length).toBe 2
      referenceId = new CQL_QDM.Id('1234567890', null)
      relatedToArray = assessmentPerformed.relatedTo()
      expect(relatedToArray[0]).toEqual referenceId

    it "should not return a result", ->
      assessmentPerformed = new CQL_QDM.AssessmentPerformed({})
      expect(JSON.stringify(assessmentPerformed.result())).toEqual('null')

    it "should return a result", ->
      assessmentPerformed = new CQL_QDM.AssessmentPerformed({'values': [
          {_id: "5aabbc4692d04e71f32f7619", codes: { 'SNOMED-CT': ["164059009"]}, description: "Pass Or Refer"}]})
      expect(JSON.stringify(assessmentPerformed.result())).toEqual('{"code":"164059009","system":"SNOMED-CT","version":null,"display":"Pass Or Refer"}')

describe "Assessment", ->
  describe "Recommended", ->
    it "should not return a negationRationale", ->
      assessmentRecommended = new CQL_QDM.AssessmentRecommended({})
      expect(assessmentRecommended.negationRationale()).toBeNull()

