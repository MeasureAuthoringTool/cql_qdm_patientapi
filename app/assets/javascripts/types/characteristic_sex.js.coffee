class CharacteristicSex
  constructor: (@patient) ->
    @_patient = @patient
  
  getCode: (params) =>
    return @_patient.get('gender')
