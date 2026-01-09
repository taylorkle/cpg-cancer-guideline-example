library IsT1cFeatureLogic version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include Common version '0.1.0'

codesystem "CaseFeatureCodes": 'http://example.org/cancer-guideline/fhir/CodeSystem/CaseFeatureCodes'
code "Is T1c Feature": 'is-t1c' from "CaseFeatureCodes"

codesystem "LOINC": 'http://loinc.org'
code "Tumor Size Code": '21889-1' from "LOINC"
code "Size.maximum Code": '33728-7' from "LOINC"

define "Tumor Size":
  [Observation: "Tumor Size Code"] TS where TS.status = 'final'

define "Most Recent Tumor Size":
  First("Tumor Size" TS sort by issued descending)

define "Most Recent Tumor Size Quantity":
  First("Most Recent Tumor Size".component C where C.code ~ "Size.maximum Code").value as Quantity

define "Is at least T1c":
  "Most Recent Tumor Size Quantity" >= 1 'cm'

/**
 * @description
 * Inference is if HER2, ER, and PR are all negative
 */
define "Is T1c Inferred":
  if not exists "Most Recent Tumor Size Quantity" then
    null
  else if "Is at least T1c" then
    Observation {
      meta: Meta {
        profile: {
          canonical { value: 'http://example.org/StructureDefinition/IsT1cFeature' }
        }
      },
      extension: {
        Extension {
          url: url { value: 'http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-instantiatesCaseFeature' },
          value: canonical { value: 'http://example.org/StructureDefinition/IsT1cFeature' }
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
            code: code { value: 'is-t1c' }
          }
        }
      },
      value: boolean { value: true }
    }
  else
    Observation {
      meta: Meta {
        profile: {
          canonical { value: 'http://example.org/StructureDefinition/IsT1cFeature' }
        }
      },
      extension: {
        Extension {
          url: url { value: 'http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-instantiatesCaseFeature' },
          value: canonical { value: 'http://example.org/StructureDefinition/IsT1cFeature' }
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
            code: code { value: 'is-t1c' }
          }
        }
      },
      value: boolean { value: false }
    }

/**
 * @description
 * Assertion is if there is a case feature directly documented
 */
define "Is T1c Asserted":
  Common.MostRecent([Observation: "Is T1c Feature"])

/**
 * @description
 * Feature is asserted followed by inferred
 */

define "Is T1c":
  Coalesce(
    "Is T1c Asserted",
    "Is T1c Inferred"
  )
