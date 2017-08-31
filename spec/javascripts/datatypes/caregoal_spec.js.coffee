describe "CareGoal", ->
  it "should return a list of ids when relatedTo is called", ->
    careGoal = new CQL_QDM.CareGoal({'references': [{'referenced_id':'1234567890', 'type':'Example'},{'referenced_id':'0987654321', 'type':'Example'}]})
    expect(careGoal.relatedTo().length).toBe 2
    referenceId = new CQL_QDM.Id('1234567890')
    relatedToArray = careGoal.relatedTo()
    expect(relatedToArray[0]).toEqual referenceId
