library Common version '0.1.0'

using FHIR version '4.0.1'

context Patient

define function MostRecent(observationList List<FHIR.Observation>):
  First(
    observationList Observation
    sort by effective.value descending
  )