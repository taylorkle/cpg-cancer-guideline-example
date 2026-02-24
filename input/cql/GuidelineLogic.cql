library GuidelineLogic version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

include IsTNBCFeatureLogic version '0.1.0' called IsTNBCFeature
include IsT1cFeatureLogic version '0.1.0' called IsT1cFeature

codesystem "Condition Clinical Status Codesystem": 'http://terminology.hl7.org/CodeSystem/condition-clinical'
codesystem "Condition Verification Status Codesystem": 'http://terminology.hl7.org/CodeSystem/condition-ver-status'

code "Active Condition Code": 'active' from "Condition Clinical Status Codesystem"
code "Confirmed Condition Code": 'confirmed' from "Condition Verification Status Codesystem"

valueset "Breast Cancer VS": 'http://example.org/cancer-guideline/fhir/ValueSet/BreastCancerICD10'

context Patient

define "Is TNBC":
  if (IsTNBCFeature."Is TNBC" is not null) then
    IsTNBCFeature."Is TNBC".value as boolean
  else
    false

define "Is at least T1c":
  if (IsT1cFeature."Is T1c" is not null) then
    IsT1cFeature."Is T1c".value as boolean
  else
    false

define "Has TNBC and at least T1c":
  "Is TNBC" and "Is at least T1c"

define "Has breast cancer":
  exists(
    [Condition: "Breast Cancer VS"] C
      where C.clinicalStatus ~ "Active Condition Code"
      and C.verificationStatus ~ "Confirmed Condition Code"
  )