/********** GENERATED on 08/14/2018 at 10:58:15 by CB0000000021**************/
 @OData.entitySet.name: 'A_CustomerDunning' 
 @OData.entityType.name: 'A_CustomerDunningType' 
 define root abstract entity /DMO/A_CUSTOMERDUNNING { 
 key Customer : abap.char( 10 ) ; 
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
 CustomerAccountGroup : abap.char( 4 ) ; 
 
 } 
