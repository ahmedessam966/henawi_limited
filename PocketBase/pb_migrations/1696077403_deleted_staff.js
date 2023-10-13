/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("s99ko04kspmg75t");

  return dao.deleteCollection(collection);
}, (db) => {
  const collection = new Collection({
    "id": "s99ko04kspmg75t",
    "created": "2023-09-30 12:36:21.552Z",
    "updated": "2023-09-30 12:36:21.552Z",
    "name": "staff",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "xdtuqowp",
        "name": "staffID",
        "type": "editor",
        "required": true,
        "presentable": true,
        "unique": false,
        "options": {
          "convertUrls": false
        }
      },
      {
        "system": false,
        "id": "kkmboowk",
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
})
