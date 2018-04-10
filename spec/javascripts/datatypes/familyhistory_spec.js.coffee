describe "FamilyHistory", ->
  it "should return null for a null relationship", ->
    familyHistory = new CQL_QDM.FamilyHistory({})
    expect(familyHistory.relationship()).toBeNull()

  it "should show valid relationship", ->
    familyHistory = new CQL_QDM.FamilyHistory({'relationshipToPatient': {'code': '12345', 'code_system': 'Bar', 'title': 'FooBar'}})
    expect(JSON.stringify(familyHistory.relationship())).toEqual('{"code":"12345","system":"Bar","version":null,"display":"FooBar"}')
