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
  * valueQuantity = 1.5 'cm' "centimeters"

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
* conclusion = "Right breast imaging demonstrates an irregular enhancing mass measuring up to 1.5 cm in greatest dimension."

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
* content.attachment.language = #en-US
* content.attachment.creation = "2026-05-18T11:30:00-04:00"
* content.attachment.size = 1669
* content.attachment.data = "JVBERi0xLjQKMSAwIG9iago8PCAvVHlwZSAvQ2F0YWxvZyAvUGFnZXMgMiAwIFIgPj4KZW5kb2JqCjIgMCBvYmoKPDwgL1R5cGUgL1BhZ2VzIC9LaWRzIFszIDAgUl0gL0NvdW50IDEgPj4KZW5kb2JqCjMgMCBvYmoKPDwgL1R5cGUgL1BhZ2UgL1BhcmVudCAyIDAgUiAvTWVkaWFCb3ggWzAgMCA2MTIgNzkyXSAvQ29udGVudHMgNCAwIFIgL1Jlc291cmNlcyA8PCAvRm9udCA8PCAvRjEgNSAwIFIgL0YyIDYgMCBSID4+ID4+ID4+CmVuZG9iago0IDAgb2JqCjw8IC9MZW5ndGggMTAxOCA+PgpzdHJlYW0KMC45NSBnCjM2IDczOCA1NDAgMjggcmUgZgowIGcKQlQKL0YyIDE2IFRmCjQ4IDc0OCBUZAooTUlEVE9XTiBQQVRIT0xPR1kgQVNTT0NJQVRFUykgVGoKRVQKQlQKL0YxIDExIFRmCjQ4IDcxNCBUZAooQnJlYXN0IEJpb21hcmtlciBQYXRob2xvZ3kgUmVwb3J0KSBUagowIC0xOCBUZAooQWNjZXNzaW9uOiBCUi0yNi0wNTE4LTE0MikgVGoKMCAtMTggVGQKKENvbGxlY3RlZDogMjAyNi0wNS0xOCAxMDo0MiBFRFQgICAgUmVwb3J0ZWQ6IDIwMjYtMDUtMTggMTE6MzAgRURUKSBUagowIC0xOCBUZAooUGF0aWVudDogSmFuZSBEb2UgICAgTVJOOiAxMDMyNzAzICAgIERPQjogMTk3MC0wMS0wMSkgVGoKMCAtMTggVGQKKFNwZWNpbWVuOiBSaWdodCBicmVhc3QgY29yZSBiaW9wc3kpIFRqCjAgLTE4IFRkCihPcmRlcmluZyBjbGluaWNpYW46IHByYWN0aXRpb25lcnNoYXJlZCkgVGoKMCAtMTggVGQKKCkgVGoKMCAtMTggVGQKKEhFUjIgSW1tdW5vaGlzdG9jaGVtaXN0cnkpIFRqCjAgLTE4IFRkCihSZXN1bHQ6IE5lZ2F0aXZlIFwoU2NvcmUgMStcKSkgVGoKMCAtMTggVGQKKEludGVycHJldGF0aW9uOiBObyBldmlkZW5jZSBvZiBIRVIyIG92ZXJleHByZXNzaW9uIG9yIGFtcGxpZmljYXRpb24uKSBUagowIC0xOCBUZAooVHVtb3IgY2VsbHMgc2hvdyBpbmNvbXBsZXRlLCBmYWludCBtZW1icmFuZSBzdGFpbmluZyBpbiA+MTAlIG9mIGNlbGxzLikgVGoKMCAtMTggVGQKKCkgVGoKMCAtMTggVGQKKENvbW1lbnQ6KSBUagowIC0xOCBUZAooRmluZGluZ3Mgc3VwcG9ydCBIRVIyLW5lZ2F0aXZlIGRpc2Vhc2UgaW4gdGhpcyBzcGVjaW1lbi4pIFRqCjAgLTE4IFRkCihDbGluaWNhbCBjb3JyZWxhdGlvbiB3aXRoIGltYWdpbmcgYW5kIG1vcnBob2xvZ3kgaXMgcmVjb21tZW5kZWQuKSBUagowIC0xOCBUZAooKSBUagowIC0xOCBUZAooUGF0aG9sb2dpc3Q6IEEuIFBhdGVsLCBNRCkgVGoKMCAtMTggVGQKKEVsZWN0cm9uaWNhbGx5IHNpZ25lZCBvdXQgb24gMjAyNi0wNS0xOCAxMTozMCBFRFQpIFRqCkVUCmVuZHN0cmVhbQplbmRvYmoKNSAwIG9iago8PCAvVHlwZSAvRm9udCAvU3VidHlwZSAvVHlwZTEgL0Jhc2VGb250IC9IZWx2ZXRpY2EgPj4KZW5kb2JqCjYgMCBvYmoKPDwgL1R5cGUgL0ZvbnQgL1N1YnR5cGUgL1R5cGUxIC9CYXNlRm9udCAvSGVsdmV0aWNhLUJvbGQgPj4KZW5kb2JqCnhyZWYKMCA3CjAwMDAwMDAwMDAgNjU1MzUgZiAKMDAwMDAwMDAwOSAwMDAwMCBuIAowMDAwMDAwMDU4IDAwMDAwIG4gCjAwMDAwMDAxMTUgMDAwMDAgbiAKMDAwMDAwMDI1MSAwMDAwMCBuIAowMDAwMDAxMzIwIDAwMDAwIG4gCjAwMDAwMDEzOTAgMDAwMDAgbiAKdHJhaWxlcgo8PCAvU2l6ZSA3IC9Sb290IDEgMCBSID4+CnN0YXJ0eHJlZgoxNDY1CiUlRU9GCg=="

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
Description: "Patient has imaging evidence of a 1.5 cm tumor size and ER, PR, and HER2-negative pathology data expressed as DocumentReference resources for LLM-based reasoning"
Usage: #example
* type = #collection
* meta.tag = #test
* insert BundleEntry(Patient, Patient1)
* insert BundleEntry(Practitioner, PractitionerShared)
* insert BundleEntry(Observation, Patient1ObservationTumorSize)
* insert BundleEntry(DiagnosticReport, Patient1BreastImagingReport)
* insert BundleEntry(DocumentReference, Patient1ERPathologyDocument)
* insert BundleEntry(DocumentReference, Patient1PRPathologyDocument)
* insert BundleEntry(DocumentReference, Patient1HER2PathologyDocument)
