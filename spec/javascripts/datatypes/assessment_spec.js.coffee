describe "Assessment", ->
  describe "Performed", ->
    it "should return a list of ids when relatedTo is called", ->
      assessmentPerformed = new CQL_QDM.AssessmentPerformed({'references': [{'referenced_id':'1234567890', 'type':'Example'},{'referenced_id':'0987654321', 'type':'Example'}]})
      expect(assessmentPerformed.relatedTo().length).toBe 2
      referenceId = new CQL_QDM.Id('1234567890')
      relatedToArray = assessmentPerformed.relatedTo()
      expect(relatedToArray[0]).toEqual referenceId
