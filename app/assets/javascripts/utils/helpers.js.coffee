###
@namespace scoping into the CQL_QDM namespace
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
  Returns an 'infinity' cql.DateTime. This is used for things like diagnosis
  that have a start time, but no stop time.
  @returns cql.DateTime
  ###
  @infinityDateTime: ->
    @convertDateTime('12/31/2999 12:59 PM')
