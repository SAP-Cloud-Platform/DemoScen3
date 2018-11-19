/********** GENERATED on 08/14/2018 at 10:58:14 by CB0000000021**************/
 @OData.entitySet.name: 'A_Customer' 
 @OData.entityType.name: 'A_CustomerType' 
 define root abstract entity /DMO/A_CUSTOMER { 
 key Customer : abap.char( 10 ) ; 
 AuthorizationGroup : abap.char( 4 ) ; 
 BillingIsBlockedForCustomer : abap.char( 2 ) ; 
 CreatedByUser : abap.char( 12 ) ; 
 CreationDate : abap.dats ; 
 CustomerAccountGroup : abap.char( 4 ) ; 
 CustomerClassification : abap.char( 2 ) ; 
 CustomerFullName : abap.char( 220 ) ; 
 CustomerName : abap.char( 80 ) ; 
 DeliveryIsBlocked : abap.char( 2 ) ; 
 NFPartnerIsNaturalPerson : abap.char( 1 ) ; 
 OrderIsBlockedForCustomer : abap.char( 2 ) ; 
 PostingIsBlocked : abap_boolean ; 
 Supplier : abap.char( 10 ) ; 
 CustomerCorporateGroup : abap.char( 10 ) ; 
 FiscalAddress : abap.char( 10 ) ; 
 Industry : abap.char( 4 ) ; 
 IndustryCode1 : abap.char( 10 ) ; 
 IndustryCode2 : abap.char( 10 ) ; 
 IndustryCode3 : abap.char( 10 ) ; 
 IndustryCode4 : abap.char( 10 ) ; 
 IndustryCode5 : abap.char( 10 ) ; 
 InternationalLocationNumber1 : abap.numc( 7 ) ; 
 NielsenRegion : abap.char( 2 ) ; 
 ResponsibleType : abap.char( 2 ) ; 
 TaxNumber1 : abap.char( 16 ) ; 
 TaxNumber2 : abap.char( 11 ) ; 
 TaxNumber3 : abap.char( 18 ) ; 
 TaxNumber4 : abap.char( 18 ) ; 
 TaxNumber5 : abap.char( 60 ) ; 
 TaxNumberType : abap.char( 2 ) ; 
 VATRegistration : abap.char( 20 ) ; 
 DeletionIndicator : abap_boolean ; 
 
 @OData.property.name: 'to_CustomerCompany' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _CustomerCompany : association [0..*] to /DMO/A_CUSTOMERCOMPANY on /DMO/A_CUSTOMER.Customer = /DMO/A_CUSTOMER.Customer; 
 @OData.property.name: 'to_CustomerSalesArea' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _CustomerSalesArea : association [0..*] to /DMO/A_CUSTOMERSALESAREA on /DMO/A_CUSTOMER.Customer = /DMO/A_CUSTOMER.Customer; 
 } 
