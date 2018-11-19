/********** GENERATED on 08/14/2018 at 10:58:13 by CB0000000021**************/
 @OData.entitySet.name: 'A_BPContactToFuncAndDept' 
 @OData.entityType.name: 'A_BPContactToFuncAndDeptType' 
 define root abstract entity /DMO/A_BPCONTACTTOFUNCANDDEPT { 
 key RelationshipNumber : abap.char( 12 ) ; 
 key BusinessPartnerCompany : abap.char( 10 ) ; 
 key BusinessPartnerPerson : abap.char( 10 ) ; 
 key ValidityEndDate : abap.dats ; 
 ContactPersonFunction : abap.char( 4 ) ; 
 ContactPersonDepartment : abap.char( 4 ) ; 
 PhoneNumber : abap.char( 30 ) ; 
 PhoneNumberExtension : abap.char( 10 ) ; 
 FaxNumber : abap.char( 30 ) ; 
 FaxNumberExtension : abap.char( 10 ) ; 
 EmailAddress : abap.char( 241 ) ; 
 RelationshipCategory : abap.char( 6 ) ; 
 
 } 
