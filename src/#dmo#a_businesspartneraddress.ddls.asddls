/********** GENERATED on 08/14/2018 at 10:58:14 by CB0000000021**************/
 @OData.entitySet.name: 'A_BusinessPartnerAddress' 
 @OData.entityType.name: 'A_BusinessPartnerAddressType' 
 define root abstract entity /DMO/A_BUSINESSPARTNERADDRESS { 
 key BusinessPartner : abap.char( 10 ) ; 
 key AddressID : abap.char( 10 ) ; 
 ValidityStartDate : tzntstmpl ; 
 ValidityEndDate : tzntstmpl ; 
 AuthorizationGroup : abap.char( 4 ) ; 
 AddressUUID : sysuuid_x16 ; 
 AdditionalStreetPrefixName : abap.char( 40 ) ; 
 AdditionalStreetSuffixName : abap.char( 40 ) ; 
 AddressTimeZone : abap.char( 6 ) ; 
 CareOfName : abap.char( 40 ) ; 
 CityCode : abap.char( 12 ) ; 
 CityName : abap.char( 40 ) ; 
 CompanyPostalCode : abap.char( 10 ) ; 
 Country : abap.char( 3 ) ; 
 County : abap.char( 40 ) ; 
 DeliveryServiceNumber : abap.char( 10 ) ; 
 DeliveryServiceTypeCode : abap.char( 4 ) ; 
 District : abap.char( 40 ) ; 
 FormOfAddress : abap.char( 4 ) ; 
 FullName : abap.char( 80 ) ; 
 HomeCityName : abap.char( 40 ) ; 
 HouseNumber : abap.char( 10 ) ; 
 HouseNumberSupplementText : abap.char( 10 ) ; 
 Language : abap.char( 2 ) ; 
 POBox : abap.char( 10 ) ; 
 POBoxDeviatingCityName : abap.char( 40 ) ; 
 POBoxDeviatingCountry : abap.char( 3 ) ; 
 POBoxDeviatingRegion : abap.char( 3 ) ; 
 POBoxIsWithoutNumber : abap_boolean ; 
 POBoxLobbyName : abap.char( 40 ) ; 
 POBoxPostalCode : abap.char( 10 ) ; 
 Person : abap.char( 10 ) ; 
 PostalCode : abap.char( 10 ) ; 
 PrfrdCommMediumType : abap.char( 3 ) ; 
 Region : abap.char( 3 ) ; 
 StreetName : abap.char( 60 ) ; 
 StreetPrefixName : abap.char( 40 ) ; 
 StreetSuffixName : abap.char( 40 ) ; 
 TaxJurisdiction : abap.char( 15 ) ; 
 TransportZone : abap.char( 10 ) ; 
 AddressIDByExternalSystem : abap.char( 20 ) ; 
 
 @OData.property.name: 'to_AddressUsage' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _AddressUsage : association [0..*] to /DMO/A_BUPAADDRESSUSAGE on /DMO/A_BUSINESSPARTNERADDRESS.AddressID = /DMO/A_BUSINESSPARTNERADDRESS.AddressID; 
 @OData.property.name: 'to_EmailAddress' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _EmailAddress : association [0..*] to /DMO/A_ADDRESSEMAILADDRESS on /DMO/A_BUSINESSPARTNERADDRESS.AddressID = /DMO/A_BUSINESSPARTNERADDRESS.AddressID; 
 @OData.property.name: 'to_FaxNumber' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _FaxNumber : association [0..*] to /DMO/A_ADDRESSFAXNUMBER on /DMO/A_BUSINESSPARTNERADDRESS.AddressID = /DMO/A_BUSINESSPARTNERADDRESS.AddressID; 
 @OData.property.name: 'to_MobilePhoneNumber' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _MobilePhoneNumber : association [0..*] to /DMO/A_ADDRESSPHONENUMBER on /DMO/A_BUSINESSPARTNERADDRESS.AddressID = /DMO/A_BUSINESSPARTNERADDRESS.AddressID; 
 @OData.property.name: 'to_PhoneNumber' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _PhoneNumber : association [0..*] to /DMO/A_ADDRESSPHONENUMBER on /DMO/A_BUSINESSPARTNERADDRESS.AddressID = /DMO/A_BUSINESSPARTNERADDRESS.AddressID; 
 @OData.property.name: 'to_URLAddress' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _URLAddress : association [0..*] to /DMO/A_ADDRESSHOMEPAGEURL on /DMO/A_BUSINESSPARTNERADDRESS.AddressID = /DMO/A_BUSINESSPARTNERADDRESS.AddressID; 
 } 
