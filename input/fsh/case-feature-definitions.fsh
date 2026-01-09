RuleSet: CaseFeatureExpressions(reference, baseExpression)
* ^extension[cpg-inferenceExpression].valueExpression.language = #text/cql-identifier
* ^extension[cpg-inferenceExpression].valueExpression.reference = "http://example.org/cancer-guideline/fhir/Library/{reference}|0.1.0"
* ^extension[cpg-inferenceExpression].valueExpression.expression = "{baseExpression} Inference"
* ^extension[cpg-assertionExpression].valueExpression.language = #text/cql-identifier
* ^extension[cpg-assertionExpression].valueExpression.reference = "http://example.org/cancer-guideline/fhir/Library/{reference}|0.1.0"
* ^extension[cpg-assertionExpression].valueExpression.expression = "{baseExpression} Assertion"
* ^extension[cpg-featureExpression].valueExpression.language = #text/cql-identifier
* ^extension[cpg-featureExpression].valueExpression.reference = "http://example.org/cancer-guideline/fhir/Library/{reference}|0.1.0"
* ^extension[cpg-featureExpression].valueExpression.expression = "{baseExpression}"

Profile: PRStatus
Parent: $mcode-tumor-marker-test
Description: """
Case Feature Definition: Progesterone receptor Ag [Presence] in Breast cancer
specimen by Immune stain
"""
* code = $LOINC#85339-0 "Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain"

Profile: ERStatus
Parent: $mcode-tumor-marker-test
Description: """
Case Feature Definition: Estrogen receptor Ag [Presence] in Breast cancer
specimen by Immune stain
"""
* code = $LOINC#85337-4 "Estrogen receptor Ag [Presence] in Breast cancer specimen by Immune stain"

Profile: HER2Status
Parent: $mcode-tumor-marker-test
Description: """
Case Feature Definition: HER2 [Interpretation] in Tissue
"""
* code = $LOINC#48676-1 "HER2 [Interpretation] in Tissue"

Profile: IsTNBCFeature
Parent: Observation
Description: """
Case Feature Definition: Triple Negative Breast Cancer Status
"""
* insert CaseFeatureExpressions(IsTNBCFeatureLogic, Is TNBC)
* code = CaseFeatureCodes#is-tnbc "Is TNBC Feature"
* value[x] only boolean
  * ^short = "Has triple negative breast cancer"
* status = #final
* subject 1..1 MS
  * ^extension[sdc-questionnaire-definitionExtractValue].extension[definition].valueUri = "http://example.org/cancer-guideline/fhir/StructureDefinition/HER2Status#Observation.subject"
  * ^extension[sdc-questionnaire-definitionExtractValue].extension[expression].valueExpression.language = #text/fhirpath
  * ^extension[sdc-questionnaire-definitionExtractValue].extension[expression].valueExpression.expression = "%resource.subject"

Profile: IsT1cFeature
Parent: Observation
Description: """
Case Feature Definition: Tumor Size
"""
* insert CaseFeatureExpressions(IsT1cFeatureLogic, Is T1c)
* code = CaseFeatureCodes#is-t1c "Is T1c Feature"
* value[x] only boolean
  * ^short = "Tumor size is at least T1c"
* status = #final
* subject 1..1 MS
  * ^extension[sdc-questionnaire-definitionExtractValue].extension[definition].valueUri = "http://example.org/cancer-guideline/fhir/StructureDefinition/HER2Status#Observation.subject"
  * ^extension[sdc-questionnaire-definitionExtractValue].extension[expression].valueExpression.language = #text/fhirpath
  * ^extension[sdc-questionnaire-definitionExtractValue].extension[expression].valueExpression.expression = "%resource.subject"
