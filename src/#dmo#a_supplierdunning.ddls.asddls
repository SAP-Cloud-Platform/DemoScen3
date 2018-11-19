/********** GENERATED on 08/14/2018 at 10:58:16 by CB0000000021**************/
 @OData.entitySet.name: 'A_SupplierDunning' 
 @OData.entityType.name: 'A_SupplierDunningType' 
 define root abstract entity /DMO/A_SUPPLIERDUNNING { 
 key Supplier : abap.char( 10 ) ; 
 key CompanyCode : abap.char( 4 ) ; 
 key DunningArea : abap.char( 2 ) ; 
 DunningBlock : abap.char( 1 ) ; 
 DunningLevel : abap.numc( 1 ) ; 
 DunningProcedure : abap.char( 4 ) ; 
 DunningRecipient : abap.char( 10 ) ; 
 LastDunnedOn : abap.dats ; 
 LegDunningProcedureOn : abap.dats ; 
 DunningClerk : abap.char( 2 ) ; 
 AuthorizationGroup : abap.char( 4 ) ; 
 SupplierAccountGroup : abap.char( 4 ) ; 
 
 } 
