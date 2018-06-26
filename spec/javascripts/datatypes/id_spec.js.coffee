describe 'ID', ->
  it 'should handle a blank naming system', ->
    id = new CQL_QDM.Id(null, null)
    expect(id.namingSystem).toBeNull()

  it 'should handle a blank value', ->
    id = new CQL_QDM.Id()
    expect(id.value).not.toBeDefined()

  it 'should handle a present value and naming system', ->
    id = new CQL_QDM.Id(5, 'foo')
    expect(id.value).toEqual 5
    expect(id.namingSystem).toEqual('foo')