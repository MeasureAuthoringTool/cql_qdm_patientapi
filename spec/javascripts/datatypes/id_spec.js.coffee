describe 'ID', ->
  it 'should handle a blank referenced_type', ->
    id = new CQL_QDM.Id(null, null, null)
    expect(id.referenced_type).toBeNull()

  it 'should handle a blank value', ->
    id = new CQL_QDM.Id()
    expect(id.value).not.toBeDefined()

  it 'should handle a present value, referenced_type, and type', ->
    id = new CQL_QDM.Id(5, 'foo', 'bar')
    expect(id.value).toEqual 5
    expect(id.referenced_type).toEqual('foo')
    expect(id.type).toEqual('bar')
