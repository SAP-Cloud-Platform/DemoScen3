/********** GENERATED on 08/14/2018 at 10:58:15 by CB0000000021**************/
 @OData.entitySet.name: 'A_CustSalesPartnerFunc' 
 @OData.entityType.name: 'A_CustSalesPartnerFuncType' 
 define root abstract entity /DMO/A_CUSTSALESPARTNERFUNC { 
 key Customer : abap.char( 10 ) ; 
 key SalesOrganization : abap.char( 4 ) ; 
 key DistributionChannel : abap.char( 2 ) ; 
 key Division : abap.char( 2 ) ; 
 key PartnerCounter : abap.numc( 3 ) ; 
 key PartnerFunction : abap.char( 2 ) ; 
 BPCustomerNumber : abap.char( 10 ) ; 
 CustomerPartnerDescription : abap.char( 30 ) ; 
 DefaultPartner : abap_boolean ; 
 AuthorizationGroup : abap.char( 4 ) ; 
 
 } 
