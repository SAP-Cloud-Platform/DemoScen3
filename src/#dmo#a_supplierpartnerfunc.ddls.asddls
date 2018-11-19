/********** GENERATED on 08/14/2018 at 10:58:16 by CB0000000021**************/
 @OData.entitySet.name: 'A_SupplierPartnerFunc' 
 @OData.entityType.name: 'A_SupplierPartnerFuncType' 
 define root abstract entity /DMO/A_SUPPLIERPARTNERFUNC { 
 key Supplier : abap.char( 10 ) ; 
 key PurchasingOrganization : abap.char( 4 ) ; 
 key SupplierSubrange : abap.char( 6 ) ; 
 key Plant : abap.char( 4 ) ; 
 key PartnerFunction : abap.char( 2 ) ; 
 key PartnerCounter : abap.numc( 3 ) ; 
 DefaultPartner : abap_boolean ; 
 CreationDate : abap.dats ; 
 CreatedByUser : abap.char( 12 ) ; 
 ReferenceSupplier : abap.char( 10 ) ; 
 AuthorizationGroup : abap.char( 4 ) ; 
 
 } 
