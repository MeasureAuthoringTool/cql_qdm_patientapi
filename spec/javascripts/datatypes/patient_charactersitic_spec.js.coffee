patientCharacteristicMaleEntry = {
  _id :"5aeb774bb848463d625b2991",
  anatomical_location :null,
  anatomical_target :null,
  causeOfDeath :null,
  codes :{"AdministrativeGender":["M"]},
  description :"Patient Characteristic: Male",
  end_time :null,
  health_record_field :null,
  laterality :null,
  mood_code :"EVN",
  name :null,
  negationInd :null,
  negationReason :null,
  oid :"2.16.840.1.113883.3.560.1.1001",
  ordinality :null,
  priority :null,
  reason :null,
  severity :null,
  specifics :null,
  start_time :-674150400,
  status_code :{"HL7 ActStatus":[null]},
  time :null,
  time_of_death :null,
  type :null
  }

describe "Patient Characteristic Male", ->
  it 'should have CODE in toString', ->
    patientCharacteristicRace = new CQL_QDM.PatientCharacteristic(patientCharacteristicMaleEntry)
    expect(patientCharacteristicRace.toString()).toEqual 'Patient Characteristic: Male\nSTART: 08/21/1948 8:00 AM\nCODE: AdministrativeGender M'
