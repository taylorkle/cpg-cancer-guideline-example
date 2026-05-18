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

// Instance: Patient1ObservationTumorSize
// InstanceOf: $mcode-tumor-size
// Usage: #inline
// * status = #final
// * category = $observation-category#laboratory
// * code = $LOINC#21889-1 "Size Tumor"
// * subject = Reference(Patient/Patient1)
// * performer = Reference(PractitionerShared)
// * method = $SCT#787377000 "Gross examination and sampling of tissue specimen (procedure)"
// * component[tumorLongestDimension]
//   * code = $LOINC#33728-7
//   * valueQuantity = 0.8 'cm' "centimeters"

Instance: Patient1BreastImagingReport
InstanceOf: DiagnosticReport
Usage: #example
* status = #final
* category = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"
* code.text = "Breast imaging report"
* subject = Reference(Patient/Patient1)
* performer = Reference(PractitionerShared)
* effectiveDateTime = "2026-05-18T09:00:00-04:00"
* issued = "2026-05-18T10:00:00-04:00"
// * result = Reference(Patient1ObservationTumorSize)
* conclusion = "Right breast imaging demonstrates an irregular enhancing mass measuring up to 0.8 cm in greatest dimension."

Instance: Patient1HER2PathologyReport
InstanceOf: DiagnosticReport
Usage: #example
* status = #final
* category = http://terminology.hl7.org/CodeSystem/v2-0074#LAB "Laboratory"
* code = $LOINC#48676-1 "HER2 [Interpretation] in Tissue"
* subject = Reference(Patient/Patient1)
* performer = Reference(PractitionerShared)
* effectiveDateTime = "2026-05-18T11:00:00-04:00"
* issued = "2026-05-18T11:30:00-04:00"
* conclusion = "Pathology biomarker testing shows HER2 is negative (1+ by immunohistochemistry), with no evidence of HER2 overexpression or amplification."

Instance: Patient1HER2PathologyDocument
InstanceOf: DocumentReference
Usage: #example
* status = #current
* type = $LOINC#11526-1 "Pathology study"
* category = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note "Clinical Note"
* subject = Reference(Patient/Patient1)
* date = "2026-05-18T11:35:00-04:00"
* author = Reference(PractitionerShared)
* description = "Breast pathology biomarker report"
* content.attachment.contentType = #application/pdf
* content.attachment.title = "HER2 pathology report.pdf"
* content.attachment.data = "JVBERi0xLjQKMSAwIG9iago8PCAvVHlwZSAvQ2F0YWxvZyAvUGFnZXMgMiAwIFIgPj4KZW5kb2JqCjIgMCBvYmoKPDwgL1R5cGUgL1BhZ2VzIC9LaWRzIFszIDAgUl0gL0NvdW50IDEgPj4KZW5kb2JqCjMgMCBvYmoKPDwgL1R5cGUgL1BhZ2UgL1BhcmVudCAyIDAgUiAvTWVkaWFCb3ggWzAgMCA2MTIgNzkyXSAvQ29udGVudHMgNCAwIFIgL1Jlc291cmNlcyA8PCAvRm9udCA8PCAvRjEgNSAwIFIgPj4gPj4gPj4KZW5kb2JqCjQgMCBvYmoKPDwgL0xlbmd0aCAxMDcgPj4Kc3RyZWFtCkJUCi9GMSAxMiBUZgo3MiA3MjAgVGQKKEhFUjIgcGF0aG9sb2d5IHJlcG9ydCkgVGoKMCAtMTggVGQKKEhFUjIgaXMgbmVnYXRpdmUgKElIQyAxKykuKSBUagowIC0xOCBUZAooTm8gSEVSMiBvdmVyZXhwcmVzc2lvbiBvciBhbXBsaWZpY2F0aW9uLikgVGoKRVQKZW5kc3RyZWFtCmVuZG9iago1IDAgb2JqCjw8IC9UeXBlIC9Gb250IC9TdWJ0eXBlIC9UeXBlMSAvQmFzZUZvbnQgL0hlbHZldGljYSA+PgplbmRvYmoKeHJlZgowIDYKMDAwMDAwMDAwMCA2NTUzNSBmIAowMDAwMDAwMDA5IDAwMDAwIG4gCjAwMDAwMDAwNTggMDAwMDAgbiAKMDAwMDAwMDExNSAwMDAwMCBuIAowMDAwMDAwMjQxIDAwMDAwIG4gCjAwMDAwMDAzOTkgMDAwMDAgbiAKdHJhaWxlcgo8PCAvU2l6ZSA2IC9Sb290IDEgMCBSID4+CnN0YXJ0eHJlZgo0NjkKJSVFT0YK"

Instance: Patient1ERPathologyDocument
InstanceOf: DocumentReference
Usage: #example
* status = #current
* type = $LOINC#11526-1 "Pathology study"
* category = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note "Clinical Note"
* subject = Reference(Patient/Patient1)
* date = "2026-05-18T11:36:00-04:00"
* author = Reference(PractitionerShared)
* description = "Breast pathology estrogen receptor report"
* content.attachment.contentType = #text/plain
* content.attachment.title = "ER pathology report"
* content.attachment.data = "UGF0aG9sb2d5IGJpb21hcmtlciByZXBvcnQ6IEVzdHJvZ2VuIHJlY2VwdG9yIChFUikgaXMgbmVnYXRpdmUgaW4gdGhlIHR1bW9yIHNhbXBsZS4="

Instance: Patient1PRPathologyDocument
InstanceOf: DocumentReference
Usage: #example
* status = #current
* type = $LOINC#11526-1 "Pathology study"
* category = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note "Clinical Note"
* subject = Reference(Patient/Patient1)
* date = "2026-05-18T11:37:00-04:00"
* author = Reference(PractitionerShared)
* description = "Breast pathology progesterone receptor report"
* content.attachment.contentType = #text/plain
* content.attachment.title = "PR pathology report"
* content.attachment.data = "UGF0aG9sb2d5IGJpb21hcmtlciByZXBvcnQ6IFByb2dlc3Rlcm9uZSByZWNlcHRvciAoUFIpIGlzIG5lZ2F0aXZlIGluIHRoZSB0dW1vciBzYW1wbGUu"

Instance: ExampleCasePatient1
InstanceOf: Bundle
Description: "Patient has imaging evidence of a 0.8 cm tumor size and ER, PR, and HER2-negative pathology data expressed as DocumentReference resources for LLM-based reasoning"
Usage: #example
* type = #collection
* meta.tag = #test
* insert BundleEntry(Patient, Patient1)
* insert BundleEntry(Practitioner, PractitionerShared)
// * insert BundleEntry(Observation, Patient1ObservationTumorSize)
* insert BundleEntry(DiagnosticReport, Patient1BreastImagingReport)
// * insert BundleEntry(DiagnosticReport, Patient1HER2PathologyReport)
* insert BundleEntry(DocumentReference, Patient1ERPathologyDocument)
* insert BundleEntry(DocumentReference, Patient1PRPathologyDocument)
* insert BundleEntry(DocumentReference, Patient1HER2PathologyDocument)
