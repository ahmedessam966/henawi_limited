/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "u73a4l4b57oz68d",
    "created": "2023-10-03 15:18:56.334Z",
    "updated": "2023-10-03 15:18:56.334Z",
    "name": "SALES",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "uamnchqq",
        "name": "Personnel_Name",
        "type": "json",
        "required": true,
        "presentable": true,
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
  const collection = dao.findCollectionByNameOrId("u73a4l4b57oz68d");

  return dao.deleteCollection(collection);
})
