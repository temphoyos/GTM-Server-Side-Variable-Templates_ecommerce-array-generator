___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "GTM server-side ecommerce arrays generator",
  "description": "Unpack the GA4 ecommerce items array from the event data object and return a single item properties array.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "itemProperty",
    "displayName": "Item property from which to generate and return an array",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "item_list_name"
  }
]


___SANDBOXED_JS_FOR_SERVER___

//Required server-side API's
const getEventData = require('getEventData');

//Accessing the ecommerce.items array from the event data object
const ecommerceItems = getEventData('items');
//Name of ecommerce item property from which to generate array 
const itemProperty = data.itemProperty;
//Generate empty array that will contain the indicated property value for all available items
const itemPropertiesArray = [];

//Code to generate new array - Iterating through the ecommerce.items array
ecommerceItems.forEach(function(items){
  for(const property in items){
    if(property === itemProperty){
      itemPropertiesArray.push(items[property]);
    }
  }
});


//Return a value
return itemPropertiesArray;


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_event_data",
        "versionId": "1"
      },
      "param": [
        {
          "key": "eventDataAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 20/11/2023, 22:33:16


