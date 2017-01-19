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
    if moment.utc(input, 'X', true).isValid()
      moment.utc(input, 'X').toDate()
    else
      moment.utc(input, 'MM/DD/YYYY hh:mm A').toDate()
