describe 'Ratio', ->
  it 'should create a ratio', ->
    id = new CQL_QDM.Ratio(1,2)
    expect(id.numerator).toEqual(1)
    expect(id.denominator).toEqual(2)