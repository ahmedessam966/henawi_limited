/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "mg4t56i7iaeudga",
    "created": "2023-09-30 16:30:38.123Z",
    "updated": "2023-09-30 16:30:38.123Z",
    "name": "Staff",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "2tksu0rm",
        "name": "Name",
        "type": "text",
        "required": true,
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
        "id": "auuf5iax",
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
        "id": "qhowtfdx",
        "name": "Age",
        "type": "number",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "min": 10,
          "max": 100,
          "noDecimal": true
        }
      },
      {
        "system": false,
        "id": "fpt1mfik",
        "name": "Gender",
        "type": "select",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "maxSelect": 1,
          "values": [
            "Male",
            "Female"
          ]
        }
      },
      {
        "system": false,
        "id": "rvt5jg5c",
        "name": "Insurance_Agent",
        "type": "text",
        "required": true,
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
        "id": "3nb2dfha",
        "name": "Insurance_Class",
        "type": "text",
        "required": true,
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
        "id": "lsayv463",
        "name": "Insurance_Validity",
        "type": "date",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "min": "2023-09-30 12:00:00.000Z",
          "max": "2030-09-30 12:00:00.000Z"
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
  const collection = dao.findCollectionByNameOrId("mg4t56i7iaeudga");

  return dao.deleteCollection(collection);
})
