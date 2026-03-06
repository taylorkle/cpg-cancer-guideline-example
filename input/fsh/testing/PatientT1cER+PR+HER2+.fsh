Instance: Patient3
InstanceOf: $mcode-cancer-patient
Usage: #example
* identifier
  * use = #usual
  * type = $v2-0203#MR "Medical Record Number"
    * text = "Medical Record Number"
  * system = "http://hospital.smarthealthit.org"
  * value = "1032702"
* gender = #female
* birthDate = "1970-02-09"
* name[0]
  * family = "Patient3"
  * given[0] = "Jane"

Instance: Patient3Condition
InstanceOf: $mcode-primary-cancer-condition
Usage: #example
* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* category = $condition-category#problem-list-item
* code = $ICD10CM#C50.011 "Malignant neoplasm of nipple and areola, right female breast"
* subject = Reference(Patient3)

Instance: Patient3ObservationTumorSize
InstanceOf: $mcode-tumor-size
Usage: #example
* status = #final
* category = $observation-category#laboratory
* code = $LOINC#21889-1 "Size Tumor"
* subject = Reference(Patient3)
* performer = Reference(PractitionerShared)
* method = $SCT#787377000 "Gross examination and sampling of tissue specimen (procedure)"
* component[tumorLongestDimension]
  * code = $LOINC#33728-7
  * valueQuantity = 1.5 'cm' "centimeters"

Instance: Patient3ObservationERNegative
InstanceOf: ERStatus
Usage: #example
* status = #final
* category[us-core] = $observation-category#laboratory
* code = $LOINC#85337-4 "Estrogen receptor Ag [Presence] in Breast cancer specimen by Immune stain"
* subject = Reference(Patient3)
* performer = Reference(PractitionerShared)
* valueCodeableConcept = $LOINC#LA6577-6 "Negative"

Instance: Patient3ObservationPRNegative
InstanceOf: PRStatus
Usage: #example
* status = #final
* category[us-core] = $observation-category#laboratory
* code = $LOINC#85339-0 "Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain"
* subject = Reference(Patient3)
* performer = Reference(PractitionerShared)
* valueCodeableConcept = $LOINC#LA6577-6 "Negative"

Instance: Patient3ObservationHER2Negative
InstanceOf: HER2Status
Usage: #example
* status = #final
* category[us-core] = $observation-category#laboratory
* code = $LOINC#48676-1 "HER2 [Interpretation] in Tissue"
* subject = Reference(Patient3)
* performer = Reference(PractitionerShared)
* valueCodeableConcept = $LOINC#LA6577-6 "Negative"

Instance: IsTNBCFeature2
InstanceOf: IsTNBCFeature
Usage: #example
* status = #final
* code = CaseFeatureCodes#is-tnbc "Is TNBC Feature"
* subject = Reference(Patient3)
* performer = Reference(PractitionerShared)
* valueBoolean = true

Instance: IsT1cFeature2
InstanceOf: IsT1cFeature
Usage: #example
* status = #final
* code = CaseFeatureCodes#is-t1c "Is T1c Feature"
* subject = Reference(Patient3)
* performer = Reference(PractitionerShared)
* valueBoolean = true

Instance: ExampleCasePatient3
InstanceOf: Bundle
Description: "Patient is T1c and TNBC"
Usage: #example
* type = #collection
* meta.tag = #test
* insert BundleEntry(Patient, Patient3)
* insert BundleEntry(Practitioner, PractitionerShared)
* insert BundleEntry(Condition, Patient3Condition)
* insert BundleEntry(Observation, Patient3ObservationTumorSize)
* insert BundleEntry(Observation, Patient3ObservationERNegative)
* insert BundleEntry(Observation, Patient3ObservationPRNegative)
* insert BundleEntry(Observation, Patient3ObservationHER2Negative)
* insert BundleEntry(Observation, IsT1cFeature2)
* insert BundleEntry(Observation, IsTNBCFeature2)