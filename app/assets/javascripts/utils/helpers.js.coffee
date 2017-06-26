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
  Returns an 'infinity' cql.DateTime. This is used for things like diagnosis
  that have a start time, but no stop time.
  @returns cql.DateTime
  ###
  @infinityDateTime: ->
    @convertDateTime('12/31/2999 12:59 PM')

  
  ###
  For DateTime values makes sure value meets the CQL standard.
  For scalar values:
    - First checks that the value component is numeric
    - Second for the unit component attempts to clean up freetext
      to match a standard version.
  ###
  @formatResult: (input) ->
    if input
      if input.codes?
        code_system = input.codes[Object.keys(input.codes)[0]]
        code = input.codes[code_system]
        new cql.Code(code, code_system)
      # A PhysicalQuantity with unit UnixTime is a TimeStamp, set in bonnie /lib/measures/patient_builder.rb
      else if input.units == 'UnixTime'
        CQL_QDM.Helpers.convertDateTime(input.scalar)
      # Check that the scalar portion is a number and the units are a non-zero length string.
      else if !isNaN(parseFloat(input.scalar)) && input.units.length > 0
        cleansedUnit = @cleanTimeUnit(input.units)
        new cql.Quantity({unit: cleansedUnit , value: input.scalar})
    else
      null
  ###
  Used to try and convert freetext time units to CQL standard units.
  ###
  time_units = {'years': 'year', 'yr': 'year', 'yrs': 'year'
    , 'months': 'month', 'month': 'month'
    , 'weeks': 'week', 'week': 'week', 'wk': 'week', 'wks': 'week'
    , 'days': 'day', 'day': 'day', 'd': 'day'
    , 'hours': 'h', 'hour': 'hour', 'hr': 'hour', 'hrs': 'hour'
    , 'minutes': 'min', 'minute': 'minute', 'min': 'minute'
    , 'seconds': 'second', 'second': 'second', 'sec': 'second'
    , 'milliseconds': 'millisecond', 'millisecond': 'millisecond', 'ms': 'millisecond'}

  ###
  Take units provided and see if they can be matched to a standard version.
  ###
  @cleanTimeUnit: (unit) ->
    if time_units[unit] then time_units[unit] else unit
