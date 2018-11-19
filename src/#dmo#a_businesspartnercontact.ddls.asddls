/********** GENERATED on 08/14/2018 at 10:58:14 by CB0000000021**************/
 @OData.entitySet.name: 'A_BusinessPartnerContact' 
 @OData.entityType.name: 'A_BusinessPartnerContactType' 
 define root abstract entity /DMO/A_BUSINESSPARTNERCONTACT { 
 key RelationshipNumber : abap.char( 12 ) ; 
 key BusinessPartnerCompany : abap.char( 10 ) ; 
 key BusinessPartnerPerson : abap.char( 10 ) ; 
 key ValidityEndDate : abap.dats ; 
 ValidityStartDate : abap.dats ; 
 IsStandardRelationship : abap_boolean ; 
 RelationshipCategory : abap.char( 6 ) ; 
 
 @OData.property.name: 'to_ContactAddress' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ContactAddress : association [0..*] to /DMO/A_BPCONTACTTOADDRESS on /DMO/A_BUSINESSPARTNERCONTACT.BusinessPartnerCompany = /DMO/A_BUSINESSPARTNERCONTACT.BusinessPartnerCompany; 
 @OData.property.name: 'to_ContactRelationship' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _ContactRelationship : association [0..1] to /DMO/A_BPCONTACTTOFUNCANDDEPT on /DMO/A_BUSINESSPARTNERCONTACT.BusinessPartnerCompany = /DMO/A_BUSINESSPARTNERCONTACT.BusinessPartnerCompany; 
 } 
