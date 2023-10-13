/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "qvufo3e3hrp5awl",
    "created": "2023-10-03 15:44:26.484Z",
    "updated": "2023-10-03 15:44:26.484Z",
    "name": "INVOICES",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "5thrifua",
        "name": "Invoice_Number",
        "type": "text",
        "required": true,
        "presentable": true,
        "unique": false,
        "options": {
          "min": null,
          "max": null,
          "pattern": ""
        }
      },
      {
        "system": false,
        "id": "3pha6xyl",
        "name": "Issued_By",
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
        "id": "noz9l0ua",
        "name": "Invoice_Total",
        "type": "number",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "min": 1,
          "max": null,
          "noDecimal": false
        }
      },
      {
        "system": false,
        "id": "kbuzjatr",
        "name": "Invoice_Date",
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
        "id": "pjdhsfpf",
        "name": "Invoice_Breakdown",
        "type": "json",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {}
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
  const collection = dao.findCollectionByNameOrId("qvufo3e3hrp5awl");

  return dao.deleteCollection(collection);
})
