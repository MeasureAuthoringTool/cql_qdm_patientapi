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
    if moment(input, 'X', true).isValid()
      moment(input, 'X').toDate()
    else
      moment(input, 'MM/DD/YYYY hh:mm A').toDate()
