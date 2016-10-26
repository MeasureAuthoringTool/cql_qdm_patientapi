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
class CQL_QDM.FamilyHistory extends CQL_QDM.QDMDatatype
  constructor: (@entry) ->
    super @entry
    @_authorDatetime = @entry.start_time
    @_relationship = @entry.relationshipToPatient

  ###
  @returns {Date}
  ###
  authorDatetime: ->
    cql.DateTime.fromDate(moment(@_authorDatetime, 'X').toDate())

  ###
  @returns {Code}
  ###
  relationshipToPatient: ->
    cql.Code(@_relationship.code, @_relationship.code_system)
