describe "Communication", ->
  describe "FromPatientToProvider", ->
    it "should return a list of codes when relatedTo is called", ->
      communication = new CQL_QDM.CommunicationFromPatientToProvider({'references': [{'referenced_id':'1234567890', 'type':'Example'},{'referenced_id':'0987654321', 'type':'Example'}]})
      expect(communication.relatedTo().length).toBe 2
      referenceCode = new cql.Code('1234567890', 'Example')
      relatedToArray = communication.relatedTo()
      expect(relatedToArray[0]).toEqual referenceCode


  describe "FromProviderToPatient", ->
    it "should return a list of codes when relatedTo is called", ->
      communication = new CQL_QDM.CommunicationFromProviderToPatient({'references': [{'referenced_id':'1234567890', 'type':'Example'},{'referenced_id':'0987654321', 'type':'Example'}]})
      expect(communication.relatedTo().length).toBe 2
      referenceCode = new cql.Code('1234567890', 'Example')
      relatedToArray = communication.relatedTo()
      expect(relatedToArray[0]).toEqual referenceCode


  describe "FromProviderToProvider", ->
    it "should return a list of codes when relatedTo is called", ->
      communication = new CQL_QDM.CommunicationFromProviderToProvider({'references': [{'referenced_id':'1234567890', 'type':'Example'},{'referenced_id':'0987654321', 'type':'Example'}]})
      expect(communication.relatedTo().length).toBe 2
      referenceCode = new cql.Code('1234567890', 'Example')
      relatedToArray = communication.relatedTo()
      expect(relatedToArray[0]).toEqual referenceCode