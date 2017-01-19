###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}


###
Various helper methods.
###
class CQL_QDM.Helpers

  ###
  @returns Moment.js object
  ###
  @convertDateTime: (input) ->
    if moment.utc(input, 'MM/DD/YYYY hh:mm A', true).isValid()
      cql.DateTime.fromDate(moment.utc(input, 'MM/DD/YYYY hh:mm A').toDate(), 0)
    else
      cql.DateTime.fromDate(moment.utc(input, 'X').toDate(), 0)
