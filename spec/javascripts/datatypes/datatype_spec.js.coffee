# example data to use as an entry object.
diagnosisEntry = {
  _id: "59a8395e5cc9753dad000011",
  anatomical_location: null,
  anatomical_target: null,
  causeOfDeath: null,
  codes: {"SNOMED-CT":["442311008"],"ICD-10-CM":["Z38.00"]},
  description: "Diagnosis: Live Birth Newborn Born in Hospital",
  end_time: 1346400900,
  health_record_field: null,
  laterality: null,
  mood_code: "EVN",
  name: null,
  negationInd: null,
  negationReason: null,
  oid: "2.16.840.1.113883.10.20.28.3.110",
  ordinality: null,
  priority: null,
  reason: null,
  severity: null,
  specifics: null,
  start_time: 1346400000,
  status_code: {"HL7 ActStatus":[null]},
  time: null,
  time_of_death: null,
  type: null
}

describe "QDMDatatype", ->
  it "should have an id for the base datatype", ->
    dataEntry = new CQL_QDM.QDMDatatype(diagnosisEntry)
    expect(dataEntry.id()).toEqual(new CQL_QDM.Id("59a8395e5cc9753dad000011"))

  it "should have an id for a non-base datatype if based on an entry", ->
    diagnosis = new CQL_QDM.Diagnosis(diagnosisEntry)
    expect(diagnosis.id()).toEqual(new CQL_QDM.Id("59a8395e5cc9753dad000011"))

  it "should return null for a datatype not based on an entry", ->
    birthdate = new CQL_QDM.PatientCharacteristicBirthdate({_id: "1234567890", birthdate: "1246400000"})
    expect(birthdate.id()).toBeNull()

  it "toString includes description when one exists", ->
    dataEntry = new CQL_QDM.QDMDatatype(diagnosisEntry)
    expect(dataEntry.toString()).toContain('Diagnosis: Live Birth Newborn Born in Hospital')

  it "toString includes constructor name when description does not exist", ->
    dataEntry = new CQL_QDM.QDMDatatype({})
    expect(dataEntry.toString()).not.toContain('Diagnosis: Live Birth Newborn Born in Hospital')
    expect(dataEntry.toString()).toContain('QDMDatatype')

  it "toString includes START time when one exists", ->
    dataEntry = new CQL_QDM.QDMDatatype(diagnosisEntry)
    expect(dataEntry.toString()).toContain('START')
    expect(dataEntry.toString()).toContain('08/31/2012 8:00 AM')

  it "toString does not include START time when one does not exist", ->
    dataEntry = new CQL_QDM.QDMDatatype({})
    expect(dataEntry.toString()).not.toContain('START')
    expect(dataEntry.toString()).not.toContain('08/31/2012 8:00 AM')

  it "toString includes STOP time when one exists", ->
    dataEntry = new CQL_QDM.QDMDatatype(diagnosisEntry)
    expect(dataEntry.toString()).toContain('STOP')
    expect(dataEntry.toString()).toContain('08/31/2012 8:15 AM')

  it "toString does not include STOP time when one does not exist", ->
    dataEntry = new CQL_QDM.QDMDatatype({})
    expect(dataEntry.toString()).not.toContain('STOP')
    expect(dataEntry.toString()).not.toContain('08/31/2012 8:15 AM')

  it "toString includes the first code", ->
    dataEntry = new CQL_QDM.QDMDatatype(diagnosisEntry)
    expect(dataEntry.toString()).toContain('SNOMED-CT 442311008')

  it "toString handles a null entry", ->
    dataEntry = new CQL_QDM.QDMDatatype(null)
    expect(dataEntry.toString()).toContain('QDMDatatype')
