Profile: PRStatus
Parent: $mcode-tumor-marker-test
Description: """
Case Feature Definition: Progesterone receptor Ag [Presence] in Breast cancer
specimen by Immune stain
"""
* code = $LOINC#85339-0 "Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain"
* valueCodeableConcept from TumorStatusVS (required)
* status = #final
* subject 1..1 MS
  * ^extension[sdc-questionnaire-definitionExtractValue].extension[definition].valueUri = "http://example.org/cancer-guideline/fhir/StructureDefinition/PRStatus#Observation.subject"
  * ^extension[sdc-questionnaire-definitionExtractValue].extension[expression].valueExpression.language = #text/fhirpath
  * ^extension[sdc-questionnaire-definitionExtractValue].extension[expression].valueExpression.expression = "%resource.subject"

Profile: ERStatus
Parent: $mcode-tumor-marker-test
Description: """
Case Feature Definition: Estrogen receptor Ag [Presence] in Breast cancer
specimen by Immune stain
"""
* code = $LOINC#85337-4 "Estrogen receptor Ag [Presence] in Breast cancer specimen by Immune stain"
* valueCodeableConcept from TumorStatusVS (required)
* status = #final
* subject 1..1 MS
  * ^extension[sdc-questionnaire-definitionExtractValue].extension[definition].valueUri = "http://example.org/cancer-guideline/fhir/StructureDefinition/ERStatus#Observation.subject"
  * ^extension[sdc-questionnaire-definitionExtractValue].extension[expression].valueExpression.language = #text/fhirpath
  * ^extension[sdc-questionnaire-definitionExtractValue].extension[expression].valueExpression.expression = "%resource.subject"


Profile: HER2Status
Parent: $mcode-tumor-marker-test
Description: """
Case Feature Definition: HER2 [Interpretation] in Tissue
"""
* code = $LOINC#48676-1 "HER2 [Interpretation] in Tissue"
* valueCodeableConcept from TumorStatusVS (required)
* status = #final
* subject 1..1 MS
  * ^extension[sdc-questionnaire-definitionExtractValue].extension[definition].valueUri = "http://example.org/cancer-guideline/fhir/StructureDefinition/HER2Status#Observation.subject"
  * ^extension[sdc-questionnaire-definitionExtractValue].extension[expression].valueExpression.language = #text/fhirpath
  * ^extension[sdc-questionnaire-definitionExtractValue].extension[expression].valueExpression.expression = "%resource.subject"

