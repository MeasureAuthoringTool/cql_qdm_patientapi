###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}


###
Data elements that meet this criterion indicate the patient’s care experience,
usually measured with a validated survey tool. The most common tool is the
Consumer Assessment of Healthcare Providers and Systems.
###
class CQL_QDM.PatientCareExperience extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = @entry.start_time

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_authorDatetime, 'X').toDate())


###
Data elements that meet this criterion indicate the provider's experience
with availability of resources (e.g., scheduling, equipment, space, and
such consumables as medications). Provider care experience gauges provider
satisfaction with key structures, processes, and outcomes in the healthcare
delivery system.
###
class CQL_QDM.ProviderCareExperience extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = @entry.start_time

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_authorDatetime, 'X').toDate())
