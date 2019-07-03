###
@namespace scoping into the CQL_QDM namespace (all classes and
their methods will be accessable through the CQL_QDM namespace)
###
@CQL_QDM ||= {}

###
Data elements that meet criteria using this datatype should document the type of plan or
program in which the patient is expected to be enrolled. The program is identified as the Issuer
(e.g., Aetna, BCBSA, Cigna, etc.). The code attribute indicates the coverage type indicating
the program in which the subject of record participates (e.g., health insurance plan policy,
disease specific policy, health maintenance organization policy, etc.)
###
class CQL_QDM.Participation extends CQL_QDM.QDMDatatype
  ###
  @param {Object} entry - the HDS data criteria object to convert
  ###
  constructor: (entry) ->
    super entry
    @_participationPeriodLow = CQL_QDM.Helpers.convertDateTime(entry.start_time)
    if entry.end_time
      @_participationPeriodHigh = CQL_QDM.Helpers.convertDateTime(entry.end_time)
    else
      # No end time; high is set to null
      @_participationPeriodHigh = null

  ###
  @returns {Interval<Date>}
  ###
  participationPeriod: ->
    low = @_participationPeriodLow
    high = @_participationPeriodHigh
    if low?
      new cql.Interval(low, high)
    else
      null