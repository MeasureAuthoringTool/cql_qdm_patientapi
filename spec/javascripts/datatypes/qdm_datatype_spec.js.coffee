describe "QDMDatatype", ->
  it "should have null code accessor if no codes", ->
    qdmDatatype = new CQL_QDM.QDMDatatype({})
    expect(qdmDatatype.code()).toBeNull

  it "should return single code if there is 1 code", ->
    qdmDatatype = new CQL_QDM.QDMDatatype({codes: {"CPT":["90630"]}})
    expect(qdmDatatype.code().code).toEqual "90630"
    expect(qdmDatatype.code().system).toEqual "CPT"

  it "should return first code if there are multiple codes", ->
    qdmDatatype = new CQL_QDM.QDMDatatype({codes: {"CPT":["90630"], "ABC":["12345"], "DEF":["54321"]}})
    expect(qdmDatatype.code().code).toEqual "90630"
    expect(qdmDatatype.code().system).toEqual "CPT"

