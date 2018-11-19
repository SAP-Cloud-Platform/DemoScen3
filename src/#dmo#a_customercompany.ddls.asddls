/********** GENERATED on 08/14/2018 at 10:58:15 by CB0000000021**************/
 @OData.entitySet.name: 'A_CustomerCompany' 
 @OData.entityType.name: 'A_CustomerCompanyType' 
 define root abstract entity /DMO/A_CUSTOMERCOMPANY { 
 key Customer : abap.char( 10 ) ; 
 key CompanyCode : abap.char( 4 ) ; 
 APARToleranceGroup : abap.char( 4 ) ; 
 AccountByCustomer : abap.char( 12 ) ; 
 AccountingClerk : abap.char( 2 ) ; 
 AccountingClerkFaxNumber : abap.char( 31 ) ; 
 AccountingClerkInternetAddress : abap.char( 130 ) ; 
 AccountingClerkPhoneNumber : abap.char( 30 ) ; 
 AlternativePayerAccount : abap.char( 10 ) ; 
 AuthorizationGroup : abap.char( 4 ) ; 
 CollectiveInvoiceVariant : abap.char( 1 ) ; 
 CustomerAccountNote : abap.char( 30 ) ; 
 CustomerHeadOffice : abap.char( 10 ) ; 
 CustomerSupplierClearingIsUsed : abap_boolean ; 
 HouseBank : abap.char( 5 ) ; 
 InterestCalculationCode : abap.char( 2 ) ; 
 InterestCalculationDate : abap.dats ; 
 IntrstCalcFrequencyInMonths : abap.numc( 2 ) ; 
 IsToBeLocallyProcessed : abap_boolean ; 
 ItemIsToBePaidSeparately : abap_boolean ; 
 LayoutSortingRule : abap.char( 3 ) ; 
 PaymentBlockingReason : abap.char( 1 ) ; 
 PaymentMethodsList : abap.char( 10 ) ; 
 PaymentTerms : abap.char( 4 ) ; 
 PaytAdviceIsSentbyEDI : abap_boolean ; 
 PhysicalInventoryBlockInd : abap_boolean ; 
 ReconciliationAccount : abap.char( 10 ) ; 
 RecordPaymentHistoryIndicator : abap_boolean ; 
 UserAtCustomer : abap.char( 15 ) ; 
 DeletionIndicator : abap_boolean ; 
 CustomerAccountGroup : abap.char( 4 ) ; 
 
 @OData.property.name: 'to_CustomerDunning' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _CustomerDunning : association [0..*] to /DMO/A_CUSTOMERDUNNING on /DMO/A_CUSTOMERCOMPANY.CompanyCode = /DMO/A_CUSTOMERCOMPANY.CompanyCode; 
 @OData.property.name: 'to_WithHoldingTax' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _WithHoldingTax : association [0..*] to /DMO/A_CUSTOMERWITHHOLDINGTAX on /DMO/A_CUSTOMERCOMPANY.CompanyCode = /DMO/A_CUSTOMERCOMPANY.CompanyCode; 
 } 
