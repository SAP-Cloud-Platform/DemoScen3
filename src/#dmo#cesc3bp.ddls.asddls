@EndUserText.label: 'Business Partner Custom Entity'

@QueryImplementedBy: '/dmo/cl_sc3_bp_query_prov'

@UI: {
  headerInfo: {
    typeName: 'Scenario 3 Business Partner',
    typeNamePlural: 'Scenario 3 Business Partners',
    title: { type: #STANDARD, value: 'name' }
  }, 
  presentationVariant: [ { sortOrder: [ { by: 'id', direction: #DESC } ] } ]
}
 
define root custom entity /DMO/CESC3BP {

      @UI.facet: [
        {
          id:       'BusinessPartner',
          purpose:  #STANDARD,
          type:     #IDENTIFICATION_REFERENCE,
          label:    'Business Partner',
          position: 10 }
      ]

      @UI: { 
      lineItem: [ {
                    type: #FOR_ACTION,
                    dataAction: 'PERSIST_BP_IN_S4',
                    label: 'Persist BP in S4',
                    invocationGrouping: #ISOLATED
                   },
                   { position: 10, label: 'Business Partner ID' }
                 ],
      identification: [{ position: 10, label: 'Business Partner ID' }]
      }
  key id : /dmo/sc3bpid ;
  
      @UI: {
      lineItem: [ { position: 20, label: 'Business Partner Name' } ],
      identification: [{ position: 20, label: 'Business Partner Name' }]
      }
      name : /dmo/sc3bpname;
      
      @UI: {
      lineItem: [ { position: 30, label: 'Country' } ],
      identification: [{ position: 30, label: 'Country' }]
      }      
      country : /dmo/sc3country;

      @UI: {
      lineItem: [ { position: 40, label: 'Country Code' } ],
      identification: [{ position: 40, label: 'Country Code' }],
      hidden: true
      }                 
      countrycode : /dmo/sc3countrycode;

      @UI: {
      lineItem: [ { position: 50, label: 'Postal Code' } ],
      identification: [{ position: 50, label: 'Postal Code' }]
      //hidden: true
      }      
      postcode : /dmo/sc3postcode;
      
      @UI: {
      lineItem: [ { position: 60, label: 'City' } ],
      identification: [{ position: 60, label: 'City' }],
      selectionField: [{ position: 20, element: 'city' }]
      }      
      city : /dmo/sc3city;
      
      @UI: {
      lineItem: [ { position: 70, label: 'Road' } ],
      identification: [{ position: 70, label: 'Road' }]
      }          
      road : /dmo/sc3road;
      

      @UI: {
      lineItem:  [ { position: 80, label: 'House Number' } ],
      identification: [{ position: 80, label: 'House Number' }]
      }
      housenumber : /dmo/sc3housenumber;
      
//    status : /dmo/sc3s4persstatus;
      
      @UI: {
      lineItem:  [ { position: 90, label: 'Business Partner ID in S4' } ],
      identification: [{ position: 90, label: 'Business Partner ID in S4' }]
      }
      s4bpid : /dmo/sc3s4bpid;

}
