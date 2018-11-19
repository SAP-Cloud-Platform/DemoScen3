/********** GENERATED on 08/14/2018 at 10:58:13 by CB0000000021**************/
 @OData.entitySet.name: 'A_BuPaIdentification' 
 @OData.entityType.name: 'A_BuPaIdentificationType' 
 define root abstract entity /DMO/A_BUPAIDENTIFICATION { 
 key BusinessPartner : abap.char( 10 ) ; 
 key BPIdentificationType : abap.char( 6 ) ; 
 key BPIdentificationNumber : abap.char( 60 ) ; 
 BPIdnNmbrIssuingInstitute : abap.char( 40 ) ; 
 BPIdentificationEntryDate : abap.dats ; 
 Country : abap.char( 3 ) ; 
 Region : abap.char( 3 ) ; 
 ValidityStartDate : abap.dats ; 
 ValidityEndDate : abap.dats ; 
 AuthorizationGroup : abap.char( 4 ) ; 
 
 } 
