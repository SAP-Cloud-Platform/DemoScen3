/********** GENERATED on 08/14/2018 at 10:58:13 by CB0000000021**************/
 @OData.entitySet.name: 'A_AddressPhoneNumber' 
 @OData.entityType.name: 'A_AddressPhoneNumberType' 
 define root abstract entity /DMO/A_ADDRESSPHONENUMBER { 
 key AddressID : abap.char( 10 ) ; 
 key Person : abap.char( 10 ) ; 
 key OrdinalNumber : abap.numc( 3 ) ; 
 DestinationLocationCountry : abap.char( 3 ) ; 
 IsDefaultPhoneNumber : abap_boolean ; 
 PhoneNumber : abap.char( 30 ) ; 
 PhoneNumberExtension : abap.char( 10 ) ; 
 InternationalPhoneNumber : abap.char( 30 ) ; 
 PhoneNumberType : abap.char( 1 ) ; 
 
 } 
