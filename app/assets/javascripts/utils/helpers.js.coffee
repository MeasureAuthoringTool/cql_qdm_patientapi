###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}


###
Various helper methods.
###
class CQL_QDM.Helpers

  ###
  Used to convert a Bonnie date + time into a compatible cql DateTime.

  @param {String} input - the date time to convert
  @returns cql.DateTime
  ###
  @convertDateTime: (input) ->
    if input?
      if moment.utc(input, 'MM/DD/YYYY hh:mm A', true).isValid() || moment.utc(input, 'MM/DD/YYYY h:mm A', true).isValid()
        cql.DateTime.fromJSDate(moment.utc(input, 'MM/DD/YYYY hh:mm A').toDate(), 0)
      else
        cql.DateTime.fromJSDate(moment.utc(input, 'X').toDate(), 0)
    else
      null


  ###
  For DateTime values makes sure value meets the CQL standard.
  For scalar values:
    - First checks that the value component is numeric
    - Second for the unit component attempts to clean up freetext
      to match a standard version.

  @param {Result} input - the result object to be parsed into a Quantity
  @returns cql.Quantity
  ###
  @formatResult: (input) ->
    if input?
      if input?.units == 'UnixTime'
        CQL_QDM.Helpers.convertDateTime(input.scalar)
      else if input.codes?
        code_system = Object.keys(input.codes)?[0]
        code = input.codes[code_system]?[0]
        display = input.description
        new cql.Code(code, code_system, null, display || null)
      else if input.code?
        code_system = input.code.code_system
        code = input.code.code
        display = input.description
        new cql.Code(code, code_system, null, display || null)
      else if input.numerator_scalar? and input.denominator_scalar?
        input.numerator_units =  "1" if !input.numerator_units? or input.numerator_units == ""
        input.denominator_units =  "1" if !input.denominator_units? or input.denominator_units == ""
        numerator = new cql.Quantity({value: input.numerator_scalar, unit: input.numerator_units})
        denominator = new cql.Quantity({value: input.denominator_scalar, unit: input.denominator_units})
        new cql.Ratio({numerator: numerator, denominator: denominator})
      # Check that the scalar portion is a number and the units are a non-zero length string.
      else if (input.scalar?.match(/^[-+]?[0-9]*\.?[0-9]+$/) != null)
        if input.units.length > 0
          new cql.Quantity({unit: input.units , value: parseFloat(input.scalar)})
        else
          parseFloat(input.scalar)
      else if input.scalar?
          input.scalar
    else
      null

  ###
  @returns {Array}
  ###
  @relatedTo: (relatedToInput) ->
    relatedToArray = []
    if relatedToInput?
      for relatedTo in relatedToInput
        if relatedTo?
          relatedToArray.push new CQL_QDM.Id(relatedTo.referenced_id, null)
    relatedToArray

  ###
  @returns {Array}
  ###
  @components: (componentsInput) ->
    components = []
    if componentsInput?
      for value in componentsInput.values
        if value?
          components.push new CQL_QDM.Component(value)
    components

  ###
  @returns {Array}
  ###
  @diagnoses: (diagnosesInput, principalDiagnosisInput) ->
    diagnoses = []
    if diagnosesInput?
      for diagnosis in diagnosesInput.values
        if diagnosis?
          diagnoses.push new cql.Code(diagnosis.code, diagnosis.code_system, null, diagnosis.title || null)
    if principalDiagnosisInput?
      diagnoses.push new cql.Code(principalDiagnosisInput.code, principalDiagnosisInput.code_system, null, principalDiagnosisInput.title || null)
    diagnoses
