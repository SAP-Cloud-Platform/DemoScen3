/********** GENERATED on 08/14/2018 at 10:58:16 by CB0000000021**************/
 @OData.entitySet.name: 'A_SupplierPurchasingOrg' 
 @OData.entityType.name: 'A_SupplierPurchasingOrgType' 
 define root abstract entity /DMO/A_SUPPLIERPURCHASINGORG { 
 key Supplier : abap.char( 10 ) ; 
 key PurchasingOrganization : abap.char( 4 ) ; 
 CalculationSchemaGroupCode : abap.char( 2 ) ; 
 DeletionIndicator : abap_boolean ; 
 IncotermsClassification : abap.char( 3 ) ; 
 IncotermsTransferLocation : abap.char( 28 ) ; 
 IncotermsVersion : abap.char( 4 ) ; 
 IncotermsLocation1 : abap.char( 70 ) ; 
 IncotermsLocation2 : abap.char( 70 ) ; 
 InvoiceIsGoodsReceiptBased : abap_boolean ; 
 MaterialPlannedDeliveryDurn : abap.dec( 3, 0 ) ; 
 MinimumOrderAmount : abap.dec( 14, 3 ) ; 
 PaymentTerms : abap.char( 4 ) ; 
 PricingDateControl : abap.char( 1 ) ; 
 PurOrdAutoGenerationIsAllowed : abap_boolean ; 
 @Semantics.currencyCode: true 
 PurchaseOrderCurrency : abap.char( 5 ) ; 
 PurchasingGroup : abap.char( 3 ) ; 
 PurchasingIsBlockedForSupplier : abap_boolean ; 
 ShippingCondition : abap.char( 2 ) ; 
 SupplierABCClassificationCode : abap.char( 1 ) ; 
 SupplierPhoneNumber : abap.char( 16 ) ; 
 SupplierRespSalesPersonName : abap.char( 30 ) ; 
 AuthorizationGroup : abap.char( 4 ) ; 
 SupplierAccountGroup : abap.char( 4 ) ; 
 
 @OData.property.name: 'to_PartnerFunction' 
//A dummy on-condition is required for associations in abstract entities 
//On-condition is not relevant for runtime 
 _PartnerFunction : association [0..*] to /DMO/A_SUPPLIERPARTNERFUNC on /DMO/A_SUPPLIERPURCHASINGORG.PurchasingOrganization = /DMO/A_SUPPLIERPURCHASINGORG.PurchasingOrganization; 
 } 
