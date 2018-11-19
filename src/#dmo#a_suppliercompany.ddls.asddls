/********** GENERATED on 08/14/2018 at 10:58:16 by CB0000000021**************/
 @OData.entitySet.name: 'A_SupplierCompany' 
 @OData.entityType.name: 'A_SupplierCompanyType' 
 define root abstract entity /DMO/A_SUPPLIERCOMPANY { 
 key Supplier : abap.char( 10 ) ; 
 key CompanyCode : abap.char( 4 ) ; 
 AuthorizationGroup : abap.char( 4 ) ; 
 CompanyCodeName : abap.char( 25 ) ; 
 PaymentBlockingReason : abap.char( 1 ) ; 
 SupplierIsBlockedForPosting : abap_boolean ; 
 AccountingClerk : abap.char( 2 ) ; 
 AccountingClerkFaxNumber : abap.char( 31 ) ; 
 AccountingClerkPhoneNumber : abap.char( 30 ) ; 
 SupplierClerk : abap.char( 15 ) ; 
 SupplierClerkURL : abap.char( 130 ) ; 
 PaymentMethodsList : abap.char( 10 ) ; 
 PaymentTerms : abap.char( 4 ) ; 
 ClearCustomerSupplier : abap_boolean ; 
 IsToBeLocallyProcessed : abap_boolean ; 
 ItemIsToBePaidSeparately : abap_boolean ; 
 PaymentIsToBeSentByEDI : abap_boolean ; 
 HouseBank : abap.char( 5 ) ; 
 CheckPaidDurationInDays : abap.dec( 3, 0 ) ; 
 BillOfExchLmtAmtInCoCodeCrcy : abap.dec( 14, 3 ) ; 
 SupplierClerkIDBySupplier : abap.char( 12 ) ; 
 ReconciliationAccount : abap.char( 10 ) ; 
 InterestCalculationCode : abap.char( 2 ) ; 
 InterestCalculationDate : abap.dats ; 
 IntrstCalcFrequencyInMonths : abap.numc( 2 ) ; 
 SupplierHeadOffice : abap.char( 10 ) ; 
 AlternativePayee : abap.char( 10 ) ; 
 LayoutSortingRule : abap.char( 3 ) ; 
 APARToleranceGroup : abap.char( 4 ) ; 
 SupplierCertificationDate : abap.dats ; 
 SupplierAccountNote : abap.char( 30 ) ; 
 WithholdingTaxCountry : abap.char( 3 ) ; 
 DeletionIndicator : abap_boolean ; 
 CashPlanningGroup : abap.char( 10 ) ; 
 IsToBeCheckedForDuplicates : abap_boolean ; 
 SupplierAccountGroup : abap.char( 4 ) ; 
 
 @OData.property.name: 'to_SupplierDunning' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SupplierDunning : association [0..*] to /DMO/A_SUPPLIERDUNNING on /DMO/A_SUPPLIERCOMPANY.CompanyCode = /DMO/A_SUPPLIERCOMPANY.CompanyCode; 
 @OData.property.name: 'to_SupplierWithHoldingTax' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SupplierWithHoldingTax : association [0..*] to /DMO/A_SUPPLIERWITHHOLDINGTAX on /DMO/A_SUPPLIERCOMPANY.CompanyCode = /DMO/A_SUPPLIERCOMPANY.CompanyCode; 
 } 
