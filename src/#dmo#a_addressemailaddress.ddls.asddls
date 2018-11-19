/********** GENERATED on 08/14/2018 at 10:58:07 by CB0000000021**************/
 @OData.entitySet.name: 'A_AddressEmailAddress' 
 @OData.entityType.name: 'A_AddressEmailAddressType' 
 define root abstract entity /DMO/A_ADDRESSEMAILADDRESS { 
 key AddressID : abap.char( 10 ) ; 
 key Person : abap.char( 10 ) ; 
 key OrdinalNumber : abap.numc( 3 ) ; 
 IsDefaultEmailAddress : abap_boolean ; 
 EmailAddress : abap.char( 241 ) ; 
 SearchEmailAddress : abap.char( 20 ) ; 
 
 } 
