###
@namespace scoping into the CQL_QDM namespace
###
@CQL_QDM ||= {}


###
To meet criteria using this datatype, the diagnosis/problem indicated by the
FamilyHistory QDM category and its corresponding value set should reflect a
diagnosis/problem of a family member. When used in timing relationships, the
recorded datetime acts as both the implicit start datetime and implicit stop
datetime.
###
class CQL_QDM.FamilyHistory
  constructor: (@entry) ->
    @_onsetAge = @entry.onsetAge
    @_recordedDatetime = @entry.recordedDatetime
    @_relationship = @entry.relationshipToPatient

  ###
  @returns {Quantity}
  ###
  onsetAge: ->
    cql.Quantity(@_onsetAge['unit'], @_onsetAge['value'])

  ###
  @returns {Date}
  ###
  recordedDatetime: ->
    cql.DateTime.fromDate(moment.utc(@_recordedDatetime, 'X').toDate())

  ###
  @returns {Code}
  ###
  relationshipToPatient: ->
    cql.Code(@_relationship.code, @_relationship.code_system)
