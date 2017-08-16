###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}

###
Represents a CQL 'facility' for use in the CQL execution engine.
###
class CQL_QDM.Facility
  constructor: (facility) ->
    @code = new cql.Code(facility.code.code, facility.code.code_system, undefined, facility.display)

    locationPeriodLow = CQL_QDM.Helpers.convertDateTime(facility.locationPeriodLow)
    locationPeriodHigh = CQL_QDM.Helpers.convertDateTime(facility.locationPeriodHigh)
    @locationPeriod = new cql.Interval(locationPeriodLow, locationPeriodHigh)

  exec: (ctx) ->
    @
  
  toString: () ->
    "#{@locationPeriod} '#{@code.toString()}'"
