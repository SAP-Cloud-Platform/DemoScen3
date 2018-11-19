/********** GENERATED on 08/14/2018 at 10:58:13 by CB0000000021**************/
 @OData.entitySet.name: 'A_AddressFaxNumber' 
 @OData.entityType.name: 'A_AddressFaxNumberType' 
 define root abstract entity /DMO/A_ADDRESSFAXNUMBER { 
 key AddressID : abap.char( 10 ) ; 
 key Person : abap.char( 10 ) ; 
 key OrdinalNumber : abap.numc( 3 ) ; 
 IsDefaultFaxNumber : abap_boolean ; 
 FaxCountry : abap.char( 3 ) ; 
 FaxNumber : abap.char( 30 ) ; 
 FaxNumberExtension : abap.char( 10 ) ; 
 InternationalFaxNumber : abap.char( 30 ) ; 
 
 } 
