RuleSet: BundleEntry(resourceType, id)
* entry[+]
  * fullUrl = "http://example.org/{resourceType}/{id}"
  * resource = {id}

Instance: PractitionerShared
InstanceOf: Practitioner
Usage: #example
* name.family = "practitionershared"

Instance: OrganizationShared
InstanceOf: Organization
Usage: #example
* name = "organizationshared"