describe "Encounter", ->
  describe "Performed", ->
    it "should show nothing if there is no diagnosis", ->
      encounterPerformed = new CQL_QDM.EncounterPerformed({})
      expect(JSON.stringify(encounterPerformed.diagnoses())).toEqual "[]"

    it "should show just the single diagnosis", ->
      encounterPerformed = new CQL_QDM.EncounterPerformed({'diagnosis': {'type': 'COL', 'values': [{'code_system': 'SNOMED-CT', 'code': '408816000', 'title': 'Artificial Rupture of Membranes'}]}})
      expect(JSON.stringify(encounterPerformed.diagnoses())).toEqual "[{\"code\":\"408816000\",\"system\":\"SNOMED-CT\"}]"

    it "should show two diagnoses", ->
      encounterPerformed = new CQL_QDM.EncounterPerformed({'diagnosis': {'type': 'COL', 'values': [{'code_system': 'SNOMED-CT', 'code': '408816000', 'title': 'Artificial Rupture of Membranes'}, {'code_system': 'ICD-10-PCS', 'code': '10D00Z0', 'title': 'Cesarean Birth'}]}})
      expect(JSON.stringify(encounterPerformed.diagnoses())).toEqual "[{\"code\":\"408816000\",\"system\":\"SNOMED-CT\"},{\"code\":\"10D00Z0\",\"system\":\"ICD-10-PCS\"}]"

    it "should show just the principal", ->
      encounterPerformed = new CQL_QDM.EncounterPerformed({'principalDiagnosis': {'_id': '59944a3c02334c775e000012', 'code': '20236002', 'code_system': 'SNOMED-CT', 'title': 'Labor'}})
      expect(JSON.stringify(encounterPerformed.diagnoses())).toEqual "[{\"code\":\"20236002\",\"system\":\"SNOMED-CT\"}]"

    it "should show two diagnoses and the principal", ->
      encounterPerformed = new CQL_QDM.EncounterPerformed({'diagnosis': {'type': 'COL', 'values': [{'code_system': 'SNOMED-CT', 'code': '408816000', 'title': 'Artificial Rupture of Membranes'}, {'code_system': 'ICD-10-PCS', 'code': '10D00Z0', 'title': 'Cesarean Birth'}]},'principalDiagnosis': {'_id': '59944a3c02334c775e000012', 'code': '20236002', 'code_system': 'SNOMED-CT', 'title': 'Labor'}})
      expect(JSON.stringify(encounterPerformed.diagnoses())).toEqual "[{\"code\":\"408816000\",\"system\":\"SNOMED-CT\"},{\"code\":\"10D00Z0\",\"system\":\"ICD-10-PCS\"},{\"code\":\"20236002\",\"system\":\"SNOMED-CT\"}]"
