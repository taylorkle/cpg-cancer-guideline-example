Instance: Patient1
InstanceOf: $mcode-cancer-patient
Usage: #example
* identifier
  * use = #usual
  * type = $v2-0203#MR "Medical Record Number"
    * text = "Medical Record Number"
  * system = "http://hospital.smarthealthit.org"
  * value = "1032703"
* gender = #female
* birthDate = "1970-01-01"
* name[0]
  * family = "Patient1"
  * given[0] = "Doe"

Instance: Patient1ObservationTumorSize
InstanceOf: $mcode-tumor-size
Usage: #inline
* status = #final
* category = $observation-category#laboratory
* code = $LOINC#21889-1 "Size Tumor"
* subject = Reference(Patient/Patient1)
* performer = Reference(PractitionerShared)
* method = $SCT#787377000 "Gross examination and sampling of tissue specimen (procedure)"
* component[tumorLongestDimension]
  * code = $LOINC#33728-7
  * valueQuantity = 1.2 'cm' "centimeters"

Instance: ExampleCasePatient1
InstanceOf: Bundle
Description: "Patient has > 1 cm tumor size"
Usage: #example
* type = #collection
* meta.tag = #test
* insert BundleEntry(Patient, Patient1)
* insert BundleEntry(Practitioner, PractitionerShared)
* insert BundleEntry(Observation, Patient1ObservationTumorSize)