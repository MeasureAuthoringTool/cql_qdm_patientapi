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
