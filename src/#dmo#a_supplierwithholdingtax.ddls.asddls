/********** GENERATED on 08/14/2018 at 10:58:16 by CB0000000021**************/
 @OData.entitySet.name: 'A_SupplierWithHoldingTax' 
 @OData.entityType.name: 'A_SupplierWithHoldingTaxType' 
 define root abstract entity /DMO/A_SUPPLIERWITHHOLDINGTAX { 
 key Supplier : abap.char( 10 ) ; 
 key CompanyCode : abap.char( 4 ) ; 
 key WithholdingTaxType : abap.char( 2 ) ; 
 ExemptionDateBegin : abap.dats ; 
 ExemptionDateEnd : abap.dats ; 
 ExemptionReason : abap.char( 2 ) ; 
 IsWithholdingTaxSubject : abap_boolean ; 
 RecipientType : abap.char( 2 ) ; 
 WithholdingTaxCertificate : abap.char( 25 ) ; 
 WithholdingTaxCode : abap.char( 2 ) ; 
 WithholdingTaxExmptPercent : abap.dec( 5, 2 ) ; 
 WithholdingTaxNumber : abap.char( 16 ) ; 
 AuthorizationGroup : abap.char( 4 ) ; 
 
 } 
