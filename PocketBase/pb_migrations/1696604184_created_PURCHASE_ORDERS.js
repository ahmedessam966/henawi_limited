/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "ruy61m5bgqma9i8",
    "created": "2023-10-06 14:56:24.111Z",
    "updated": "2023-10-06 14:56:24.111Z",
    "name": "PURCHASE_ORDERS",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "axxaebs9",
        "name": "Client",
        "type": "relation",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "collectionId": "aphxpeuw72gjdzv",
          "cascadeDelete": true,
          "minSelect": null,
          "maxSelect": 1,
          "displayFields": null
        }
      },
      {
        "system": false,
        "id": "snmzxtnz",
        "name": "Request",
        "type": "json",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {}
      },
      {
        "system": false,
        "id": "tdp7wqvd",
        "name": "PO_Date",
        "type": "date",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "min": "",
          "max": ""
        }
      },
      {
        "system": false,
        "id": "wk37xyod",
        "name": "PO_Number",
        "type": "text",
        "required": true,
        "presentable": true,
        "unique": false,
        "options": {
          "min": 1,
          "max": null,
          "pattern": ""
        }
      }
    ],
    "indexes": [],
    "listRule": null,
    "viewRule": null,
    "createRule": null,
    "updateRule": null,
    "deleteRule": null,
    "options": {}
  });

  return Dao(db).saveCollection(collection);
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("ruy61m5bgqma9i8");

  return dao.deleteCollection(collection);
})
