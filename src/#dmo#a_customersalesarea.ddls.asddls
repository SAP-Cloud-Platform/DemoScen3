/********** GENERATED on 08/14/2018 at 10:58:15 by CB0000000021**************/
 @OData.entitySet.name: 'A_CustomerSalesArea' 
 @OData.entityType.name: 'A_CustomerSalesAreaType' 
 define root abstract entity /DMO/A_CUSTOMERSALESAREA { 
 key Customer : abap.char( 10 ) ; 
 key SalesOrganization : abap.char( 4 ) ; 
 key DistributionChannel : abap.char( 2 ) ; 
 key Division : abap.char( 2 ) ; 
 AccountByCustomer : abap.char( 12 ) ; 
 AuthorizationGroup : abap.char( 4 ) ; 
 BillingIsBlockedForCustomer : abap.char( 2 ) ; 
 CompleteDeliveryIsDefined : abap_boolean ; 
 @Semantics.currencyCode: true 
 Currency : abap.char( 5 ) ; 
 CustomerABCClassification : abap.char( 2 ) ; 
 CustomerAccountAssignmentGroup : abap.char( 2 ) ; 
 CustomerGroup : abap.char( 2 ) ; 
 CustomerPaymentTerms : abap.char( 4 ) ; 
 CustomerPriceGroup : abap.char( 2 ) ; 
 CustomerPricingProcedure : abap.char( 2 ) ; 
 DeliveryIsBlockedForCustomer : abap.char( 2 ) ; 
 DeliveryPriority : abap.numc( 2 ) ; 
 IncotermsClassification : abap.char( 3 ) ; 
 IncotermsLocation2 : abap.char( 70 ) ; 
 IncotermsVersion : abap.char( 4 ) ; 
 IncotermsLocation1 : abap.char( 70 ) ; 
 DeletionIndicator : abap_boolean ; 
 IncotermsTransferLocation : abap.char( 28 ) ; 
 InvoiceDate : abap.char( 2 ) ; 
 ItemOrderProbabilityInPercent : abap.numc( 3 ) ; 
 OrderCombinationIsAllowed : abap_boolean ; 
 OrderIsBlockedForCustomer : abap.char( 2 ) ; 
 PartialDeliveryIsAllowed : abap.char( 1 ) ; 
 PriceListType : abap.char( 2 ) ; 
 SalesGroup : abap.char( 3 ) ; 
 SalesOffice : abap.char( 4 ) ; 
 ShippingCondition : abap.char( 2 ) ; 
 SupplyingPlant : abap.char( 4 ) ; 
 SalesDistrict : abap.char( 6 ) ; 
 CustomerAccountGroup : abap.char( 4 ) ; 
 
 @OData.property.name: 'to_PartnerFunction' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _PartnerFunction : association [0..*] to /DMO/A_CUSTSALESPARTNERFUNC on /DMO/A_CUSTOMERSALESAREA.Customer = /DMO/A_CUSTOMERSALESAREA.Customer; 
 @OData.property.name: 'to_SalesAreaTax' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _SalesAreaTax : association [0..*] to /DMO/A_CUSTOMERSALESAREATAX on /DMO/A_CUSTOMERSALESAREA.Customer = /DMO/A_CUSTOMERSALESAREA.Customer; 
 } 
