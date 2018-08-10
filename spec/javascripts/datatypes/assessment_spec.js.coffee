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

    it "should contain a method code", ->
      assessmentPerformed = new CQL_QDM.AssessmentPerformed({})
      expect(typeof assessmentPerformed.method).toEqual 'function'

  describe "Recommended", ->
    it "should not return a negationRationale", ->
      assessmentRecommended = new CQL_QDM.AssessmentRecommended({})
      expect(assessmentRecommended.negationRationale()).toBeNull()

    it "should not contain a method code", ->
      # method removed from Assessment, Recommended in QDM 5.4
      # because 'method' remains on the HDS model and because of how Bonnie shows field values
      # (based on "Assessment" rather than "Assessment, Recommended"), it's still possible to have it on
      # the model even when it shouldn't be. Confirm that this is not accessible through the
      # generated QDM model.
      assessmentRecommended = new CQL_QDM.AssessmentRecommended({})
      expect(typeof assessmentRecommended.method).toEqual 'undefined'

