/********** GENERATED on 08/14/2018 at 10:58:13 by CB0000000021**************/
 @OData.entitySet.name: 'A_AddressHomePageURL' 
 @OData.entityType.name: 'A_AddressHomePageURLType' 
 define root abstract entity /DMO/A_ADDRESSHOMEPAGEURL { 
 key AddressID : abap.char( 10 ) ; 
 key Person : abap.char( 10 ) ; 
 key OrdinalNumber : abap.numc( 3 ) ; 
 key ValidityStartDate : abap.dats ; 
 key IsDefaultURLAddress : abap_boolean ; 
 SearchURLAddress : abap.char( 50 ) ; 
 URLFieldLength : abap.int2 ; 
 WebsiteURL : abap.string( 0 ) ; 
 
 } 
