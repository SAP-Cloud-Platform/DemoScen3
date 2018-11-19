/********** GENERATED on 08/14/2018 at 10:58:14 by CB0000000021**************/
 @OData.entitySet.name: 'A_BusinessPartnerRole' 
 @OData.entityType.name: 'A_BusinessPartnerRoleType' 
 define root abstract entity /DMO/A_BUSINESSPARTNERROLE { 
 key BusinessPartner : abap.char( 10 ) ; 
 key BusinessPartnerRole : abap.char( 6 ) ; 
 ValidFrom : tzntstmpl ; 
 ValidTo : tzntstmpl ; 
 AuthorizationGroup : abap.char( 4 ) ; 
 
 } 
