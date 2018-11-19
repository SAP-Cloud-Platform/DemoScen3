/********** GENERATED on 08/14/2018 at 10:58:15 by CB0000000021**************/
 @OData.entitySet.name: 'A_Supplier' 
 @OData.entityType.name: 'A_SupplierType' 
 define root abstract entity /DMO/A_SUPPLIER { 
 key Supplier : abap.char( 10 ) ; 
 AlternativePayeeAccountNumber : abap.char( 10 ) ; 
 AuthorizationGroup : abap.char( 4 ) ; 
 CreatedByUser : abap.char( 12 ) ; 
 CreationDate : abap.dats ; 
 Customer : abap.char( 10 ) ; 
 PaymentIsBlockedForSupplier : abap_boolean ; 
 PostingIsBlocked : abap_boolean ; 
 PurchasingIsBlocked : abap_boolean ; 
 SupplierAccountGroup : abap.char( 4 ) ; 
 SupplierFullName : abap.char( 220 ) ; 
 SupplierName : abap.char( 80 ) ; 
 VATRegistration : abap.char( 20 ) ; 
 BirthDate : abap.dats ; 
 ConcatenatedInternationalLocNo : abap.char( 20 ) ; 
 DeletionIndicator : abap_boolean ; 
 FiscalAddress : abap.char( 10 ) ; 
 Industry : abap.char( 4 ) ; 
 InternationalLocationNumber1 : abap.numc( 7 ) ; 
 InternationalLocationNumber2 : abap.numc( 5 ) ; 
 InternationalLocationNumber3 : abap.numc( 1 ) ; 
 IsNaturalPerson : abap.char( 1 ) ; 
 ResponsibleType : abap.char( 2 ) ; 
 SuplrQltyInProcmtCertfnValidTo : abap.dats ; 
 SuplrQualityManagementSystem : abap.char( 4 ) ; 
 SupplierCorporateGroup : abap.char( 10 ) ; 
 SupplierProcurementBlock : abap.char( 2 ) ; 
 TaxNumber1 : abap.char( 16 ) ; 
 TaxNumber2 : abap.char( 11 ) ; 
 TaxNumber3 : abap.char( 18 ) ; 
 TaxNumber4 : abap.char( 18 ) ; 
 TaxNumber5 : abap.char( 60 ) ; 
 TaxNumberResponsible : abap.char( 18 ) ; 
 TaxNumberType : abap.char( 2 ) ; 
 
 @OData.property.name: 'to_SupplierCompany' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SupplierCompany : association [0..*] to /DMO/A_SUPPLIERCOMPANY on /DMO/A_SUPPLIER.Supplier = /DMO/A_SUPPLIER.Supplier; 
 @OData.property.name: 'to_SupplierPurchasingOrg' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SupplierPurchasingOrg : association [0..*] to /DMO/A_SUPPLIERPURCHASINGORG on /DMO/A_SUPPLIER.Supplier = /DMO/A_SUPPLIER.Supplier; 
 } 
