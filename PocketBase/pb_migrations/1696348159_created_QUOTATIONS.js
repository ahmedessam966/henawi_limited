/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "u60zl53zdwo465y",
    "created": "2023-10-03 15:49:19.712Z",
    "updated": "2023-10-03 15:49:19.712Z",
    "name": "QUOTATIONS",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "ekf4mhjl",
        "name": "Quotation_Number",
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
        "id": "i67n0heb",
        "name": "Quotation_Date",
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
        "id": "abbt7iru",
        "name": "Requisition",
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
  const collection = dao.findCollectionByNameOrId("u60zl53zdwo465y");

  return dao.deleteCollection(collection);
})
