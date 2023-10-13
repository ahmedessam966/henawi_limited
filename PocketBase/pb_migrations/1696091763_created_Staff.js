/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "57e894z8itiutpb",
    "created": "2023-09-30 16:36:03.071Z",
    "updated": "2023-09-30 16:36:03.071Z",
    "name": "Staff",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "2ojgm4ce",
        "name": "Name",
        "type": "editor",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "convertUrls": false
        }
      },
      {
        "system": false,
        "id": "pdohbe2s",
        "name": "Insurance_Agent",
        "type": "text",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "min": null,
          "max": null,
          "pattern": ""
        }
      },
      {
        "system": false,
        "id": "w8eiinzk",
        "name": "Email",
        "type": "email",
        "required": true,
        "presentable": true,
        "unique": false,
        "options": {
          "exceptDomains": [],
          "onlyDomains": []
        }
      },
      {
        "system": false,
        "id": "wkwijxwk",
        "name": "Phone",
        "type": "text",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "min": null,
          "max": 14,
          "pattern": ""
        }
      },
      {
        "system": false,
        "id": "znttdefo",
        "name": "Insurance_Class",
        "type": "text",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "min": null,
          "max": 1,
          "pattern": ""
        }
      },
      {
        "system": false,
        "id": "w7gfoivo",
        "name": "Insurance_Validity",
        "type": "date",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "min": "",
          "max": "2030-10-31 12:00:00.000Z"
        }
      }
    ],
    "indexes": [],
    "listRule": "",
    "viewRule": "",
    "createRule": "",
    "updateRule": "",
    "deleteRule": "",
    "options": {}
  });

  return Dao(db).saveCollection(collection);
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("57e894z8itiutpb");

  return dao.deleteCollection(collection);
})
