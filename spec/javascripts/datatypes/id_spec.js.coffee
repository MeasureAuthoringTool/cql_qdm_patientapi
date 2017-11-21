describe 'ID', ->
  it 'Should handle a blank namingSystem', ->
    id = new CQL_QDM.Id(null, null)
    expect(id.namingSystem).toBeNull()

  it 'Should handle a blank value', ->
    id = new CQL_QDM.Id()
    expect(id.value).not.toBeDefined()

  it 'Should handle a present namingSystem and value', ->
    id = new CQL_QDM.Id(5, 'foo')
    expect(id.value).toEqual 5
    expect(id.namingSystem).toEqual('foo')
