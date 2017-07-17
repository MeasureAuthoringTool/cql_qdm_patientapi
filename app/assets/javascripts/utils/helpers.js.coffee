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
    if moment.utc(input, 'MM/DD/YYYY hh:mm A', true).isValid()
      cql.DateTime.fromDate(moment.utc(input, 'MM/DD/YYYY hh:mm A').toDate(), 0)
    else
      cql.DateTime.fromDate(moment.utc(input, 'X').toDate(), 0)

  ###
  Returns an 'end of range' cql.DateTime.
  See Section 3.4.1 "System-Defined Types" in the CQL specification.

  @returns cql.DateTime
  ###
  @infinityDateTime: ->
    cql.DateTime.parse('9999-12-31T23:59:59.999+0000')

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
    if input
      if input.codes?
        code_system = Object.keys(input.codes)?[0]
        code = input.codes[code_system]?[0]
        new cql.Code(code, code_system)
      # Check that the scalar portion is a number and the units are a non-zero length string.
      else if (input.scalar.match(/^[-+]?[0-9]*\.?[0-9]+$/) != null) 
        if input.units.length > 0
          new cql.Quantity({unit: input.units , value: parseFloat(input.scalar)})
        else
          parseFloat(input.scalar)
    else
      null
