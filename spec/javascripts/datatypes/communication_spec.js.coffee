describe "Communication", ->
  describe "Performed", ->
    it "should return a list of ids when relatedTo is called", ->
      communication = new CQL_QDM.CommunicationPerformed({'references': [{'referenced_id':'1234567890', 'type':'Example'},{'referenced_id':'0987654321', 'type':'Example'}]})
      expect(communication.relatedTo().length).toBe 2
      referenceId = new CQL_QDM.Id('1234567890', null)
      relatedToArray = communication.relatedTo()
      expect(relatedToArray[0]).toEqual referenceId
