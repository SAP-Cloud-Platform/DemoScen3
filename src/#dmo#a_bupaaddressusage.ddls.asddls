/********** GENERATED on 08/14/2018 at 10:58:13 by CB0000000021**************/
 @OData.entitySet.name: 'A_BuPaAddressUsage' 
 @OData.entityType.name: 'A_BuPaAddressUsageType' 
 define root abstract entity /DMO/A_BUPAADDRESSUSAGE { 
 key BusinessPartner : abap.char( 10 ) ; 
 key ValidityEndDate : tzntstmpl ; 
 key AddressUsage : abap.char( 10 ) ; 
 key AddressID : abap.char( 10 ) ; 
 ValidityStartDate : tzntstmpl ; 
 StandardUsage : abap_boolean ; 
 AuthorizationGroup : abap.char( 4 ) ; 
 
 } 
