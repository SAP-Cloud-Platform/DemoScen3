/********** GENERATED on 08/14/2018 at 10:58:14 by CB0000000021**************/
 @OData.entitySet.name: 'A_BusinessPartnerTaxNumber' 
 @OData.entityType.name: 'A_BusinessPartnerTaxNumberType' 
 define root abstract entity /DMO/A_BUSINESSPARTNERTAXNUMBE { 
 key BusinessPartner : abap.char( 10 ) ; 
 key BPTaxType : abap.char( 4 ) ; 
 BPTaxNumber : abap.char( 20 ) ; 
 AuthorizationGroup : abap.char( 4 ) ; 
 
 } 
