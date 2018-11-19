/********** GENERATED on 08/14/2018 at 10:58:15 by CB0000000021**************/
 @OData.entitySet.name: 'A_CustomerWithHoldingTax' 
 @OData.entityType.name: 'A_CustomerWithHoldingTaxType' 
 define root abstract entity /DMO/A_CUSTOMERWITHHOLDINGTAX { 
 key Customer : abap.char( 10 ) ; 
 key CompanyCode : abap.char( 4 ) ; 
 key WithholdingTaxType : abap.char( 2 ) ; 
 WithholdingTaxCode : abap.char( 2 ) ; 
 WithholdingTaxAgent : abap_boolean ; 
 ObligationDateBegin : abap.dats ; 
 ObligationDateEnd : abap.dats ; 
 WithholdingTaxNumber : abap.char( 16 ) ; 
 WithholdingTaxCertificate : abap.char( 25 ) ; 
 WithholdingTaxExmptPercent : abap.dec( 5, 2 ) ; 
 ExemptionDateBegin : abap.dats ; 
 ExemptionDateEnd : abap.dats ; 
 ExemptionReason : abap.char( 2 ) ; 
 AuthorizationGroup : abap.char( 4 ) ; 
 
 } 
