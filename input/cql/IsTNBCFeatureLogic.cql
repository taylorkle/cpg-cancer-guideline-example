library IsTNBCFeatureLogic version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include Common version '0.1.0'

codesystem "CaseFeatureCodes": 'http://example.org/cancer-guideline/fhir/CodeSystem/CaseFeatureCodes'
code "Is TNBC Feature": 'is-tnbc' from "CaseFeatureCodes"

codesystem "LOINC": 'http://loinc.org'

code "ERStatus Code": '85337-4' from "LOINC"
code "PRStatus Code": '85339-0' from "LOINC"
code "HER2Status Code": '48676-1' from "LOINC"

code "Negative Status Code": 'LA6577-6' from "LOINC"
code "Positive Status Code": 'LA6576-8' from "LOINC"

context Patient

define "Is ER negative":
  First(
    [Observation: "ERStatus Code"] ER
      where ER.status = 'final' sort by issued descending
  ).value ~ "Negative Status Code"

define "Is PR negative":
  First(
    [Observation: "PRStatus Code"] ER
      where ER.status = 'final' sort by issued descending
  ).value ~ "Negative Status Code"

define "Is HER2 negative":
  First(
    [Observation: "HER2Status Code"] ER
      where ER.status = 'final' sort by issued descending
  ).value ~ "Negative Status Code"

/**
 * @description
 * Inference is if HER2, ER, and PR are all negative
 */
define "Is TNBC Inferred":
    if "Is ER negative" and "Is PR negative" and "Is HER2 negative" then
    Observation {
      meta: Meta {
        profile: {
          canonical { value: 'http://example.org/StructureDefinition/IsTNBCFeature' }
        }
      },
      extension: {
        Extension {
          url: url { value: 'http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-instantiatesCaseFeature' },
          value: canonical { value: 'http://example.org/StructureDefinition/IsTNBCFeature' }
        },
        Extension {
          url: url { value: 'http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-caseFeatureType' },
          value: code { value: 'inferred' }
        }
      },
      status: ObservationStatus { value: 'final' },
      effective: dateTime { value: Now() },
      code: CodeableConcept {
        coding: {
          Coding {
            system: uri { value: 'http://example.org/cancer-guideline/fhir/CodeSystem/CaseFeatureCodes' },
            code: code { value: 'is-tnbc' }
          }
        }
      },
      value: boolean { value: true }
    }
  else null

/**
 * @description
 * Assertion is if there is a case feature directly documented
 */
define "Is TNBC Asserted":
  Common.MostRecent([Observation: "Is TNBC Feature"])

/**
 * @description
 * Feature is asserted followed by inferred
 */

define "Is TNBC":
  Coalesce(
    "Is TNBC Asserted",
    "Is TNBC Inferred"
  )
