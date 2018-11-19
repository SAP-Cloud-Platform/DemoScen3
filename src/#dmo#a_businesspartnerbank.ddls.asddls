/********** GENERATED on 08/14/2018 at 10:58:14 by CB0000000021**************/
 @OData.entitySet.name: 'A_BusinessPartnerBank' 
 @OData.entityType.name: 'A_BusinessPartnerBankType' 
 define root abstract entity /DMO/A_BUSINESSPARTNERBANK { 
 key BusinessPartner : abap.char( 10 ) ; 
 key BankIdentification : abap.char( 4 ) ; 
 BankCountryKey : abap.char( 3 ) ; 
 BankName : abap.char( 60 ) ; 
 BankNumber : abap.char( 15 ) ; 
 SWIFTCode : abap.char( 11 ) ; 
 BankControlKey : abap.char( 2 ) ; 
 BankAccountHolderName : abap.char( 60 ) ; 
 BankAccountName : abap.char( 40 ) ; 
 ValidityStartDate : tzntstmpl ; 
 ValidityEndDate : tzntstmpl ; 
 IBAN : abap.char( 34 ) ; 
 IBANValidityStartDate : abap.dats ; 
 BankAccount : abap.char( 18 ) ; 
 BankAccountReferenceText : abap.char( 20 ) ; 
 CollectionAuthInd : abap_boolean ; 
 CityName : abap.char( 35 ) ; 
 AuthorizationGroup : abap.char( 4 ) ; 
 
 } 
