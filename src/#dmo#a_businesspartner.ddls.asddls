/********** GENERATED on 08/14/2018 at 10:58:14 by CB0000000021**************/
 @OData.entitySet.name: 'A_BusinessPartner' 
 @OData.entityType.name: 'A_BusinessPartnerType' 
 define root abstract entity /DMO/A_BUSINESSPARTNER { 
 key BusinessPartner : abap.char( 10 ) ; 
 Customer : abap.char( 10 ) ; 
 Supplier : abap.char( 10 ) ; 
 AcademicTitle : abap.char( 4 ) ; 
 AuthorizationGroup : abap.char( 4 ) ; 
 BusinessPartnerCategory : abap.char( 1 ) ; 
 BusinessPartnerFullName : abap.char( 81 ) ; 
 BusinessPartnerGrouping : abap.char( 4 ) ; 
 BusinessPartnerName : abap.char( 81 ) ; 
 BusinessPartnerUUID : sysuuid_x16 ; 
 CorrespondenceLanguage : abap.char( 2 ) ; 
 CreatedByUser : abap.char( 12 ) ; 
 CreationDate : abap.dats ; 
 CreationTime : abap.tims ; 
 FirstName : abap.char( 40 ) ; 
 FormOfAddress : abap.char( 4 ) ; 
 Industry : abap.char( 10 ) ; 
 InternationalLocationNumber1 : abap.numc( 7 ) ; 
 InternationalLocationNumber2 : abap.numc( 5 ) ; 
 IsFemale : abap_boolean ; 
 IsMale : abap_boolean ; 
 IsNaturalPerson : abap.char( 1 ) ; 
 IsSexUnknown : abap_boolean ; 
 Language : abap.char( 2 ) ; 
 LastChangeDate : abap.dats ; 
 LastChangeTime : abap.tims ; 
 LastChangedByUser : abap.char( 12 ) ; 
 LastName : abap.char( 40 ) ; 
 LegalForm : abap.char( 2 ) ; 
 OrganizationBPName1 : abap.char( 40 ) ; 
 OrganizationBPName2 : abap.char( 40 ) ; 
 OrganizationBPName3 : abap.char( 40 ) ; 
 OrganizationBPName4 : abap.char( 40 ) ; 
 OrganizationFoundationDate : abap.dats ; 
 OrganizationLiquidationDate : abap.dats ; 
 SearchTerm1 : abap.char( 20 ) ; 
 AdditionalLastName : abap.char( 40 ) ; 
 BirthDate : abap.dats ; 
 BusinessPartnerIsBlocked : abap_boolean ; 
 BusinessPartnerType : abap.char( 4 ) ; 
 ETag : abap.char( 26 ) ; 
 GroupBusinessPartnerName1 : abap.char( 40 ) ; 
 GroupBusinessPartnerName2 : abap.char( 40 ) ; 
 IndependentAddressID : abap.char( 10 ) ; 
 InternationalLocationNumber3 : abap.numc( 1 ) ; 
 MiddleName : abap.char( 40 ) ; 
 NameCountry : abap.char( 3 ) ; 
 NameFormat : abap.char( 2 ) ; 
 PersonFullName : abap.char( 80 ) ; 
 PersonNumber : abap.char( 10 ) ; 
 IsMarkedForArchiving : abap_boolean ; 
 BusinessPartnerIDByExtSystem : abap.char( 20 ) ; 
 
// @OData.property.name: 'to_BuPaIdentification' 
////A dummy on-condition is required for associations in abstract entities 
////On-condition is not relevant for runtime 
// _BuPaIdentification : association [0..*] to /DMO/A_BUPAIDENTIFICATION on /DMO/A_BUSINESSPARTNER.BusinessPartner = /DMO/A_BUSINESSPARTNER.BusinessPartner; 
 @OData.property.name: 'to_BusinessPartnerAddress' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _BusinessPartnerAddress : association [0..*] to /DMO/A_BUSINESSPARTNERADDRESS on /DMO/A_BUSINESSPARTNER.BusinessPartner = /DMO/A_BUSINESSPARTNER.BusinessPartner; 
// @OData.property.name: 'to_BusinessPartnerBank' 
////A dummy on-condition is required for associations in abstract entities 
////On-condition is not relevant for runtime 
// _BusinessPartnerBank : association [0..*] to /DMO/A_BUSINESSPARTNERBANK on /DMO/A_BUSINESSPARTNER.BusinessPartner = /DMO/A_BUSINESSPARTNER.BusinessPartner; 
// @OData.property.name: 'to_BusinessPartnerContact' 
////A dummy on-condition is required for associations in abstract entities 
////On-condition is not relevant for runtime 
// _BusinessPartnerContact : association [0..*] to /DMO/A_BUSINESSPARTNERCONTACT on /DMO/A_BUSINESSPARTNER.BusinessPartner = /DMO/A_BUSINESSPARTNER.BusinessPartner; 
// @OData.property.name: 'to_BusinessPartnerRole' 
////A dummy on-condition is required for associations in abstract entities 
////On-condition is not relevant for runtime 
// _BusinessPartnerRole : association [0..*] to /DMO/A_BUSINESSPARTNERROLE on /DMO/A_BUSINESSPARTNER.BusinessPartner = /DMO/A_BUSINESSPARTNER.BusinessPartner; 
// @OData.property.name: 'to_BusinessPartnerTax' 
////A dummy on-condition is required for associations in abstract entities 
////On-condition is not relevant for runtime 
// _BusinessPartnerTax : association [0..*] to /DMO/A_BUSINESSPARTNERTAXNUMBE on /DMO/A_BUSINESSPARTNER.BusinessPartner = /DMO/A_BUSINESSPARTNER.BusinessPartner; 
// @OData.property.name: 'to_Customer' 
////A dummy on-condition is required for associations in abstract entities 
////On-condition is not relevant for runtime 
// _Customer : association [0..1] to /DMO/A_CUSTOMER on /DMO/A_BUSINESSPARTNER.BusinessPartner = /DMO/A_BUSINESSPARTNER.BusinessPartner; 
// @OData.property.name: 'to_Supplier' 
////A dummy on-condition is required for associations in abstract entities 
////On-condition is not relevant for runtime 
// _Supplier : association [0..1] to /DMO/A_SUPPLIER on /DMO/A_BUSINESSPARTNER.BusinessPartner = /DMO/A_BUSINESSPARTNER.BusinessPartner; 
 } 
