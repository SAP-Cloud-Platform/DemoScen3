/********** GENERATED on 08/14/2018 at 10:58:15 by CB0000000021**************/
 @OData.entitySet.name: 'A_CustomerSalesAreaTax' 
 @OData.entityType.name: 'A_CustomerSalesAreaTaxType' 
 define root abstract entity /DMO/A_CUSTOMERSALESAREATAX { 
 key Customer : abap.char( 10 ) ; 
 key SalesOrganization : abap.char( 4 ) ; 
 key DistributionChannel : abap.char( 2 ) ; 
 key Division : abap.char( 2 ) ; 
 key DepartureCountry : abap.char( 3 ) ; 
 key CustomerTaxCategory : abap.char( 4 ) ; 
 CustomerTaxClassification : abap.char( 1 ) ; 
 
 } 
