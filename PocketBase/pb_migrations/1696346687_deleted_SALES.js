/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("u73a4l4b57oz68d");

  return dao.deleteCollection(collection);
}, (db) => {
  const collection = new Collection({
    "id": "u73a4l4b57oz68d",
    "created": "2023-10-03 15:18:56.334Z",
    "updated": "2023-10-03 15:23:48.729Z",
    "name": "SALES",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "h1aagirs",
        "name": "September_2023",
        "type": "relation",
        "required": true,
        "presentable": true,
        "unique": false,
        "options": {
          "collectionId": "rodlddr5xym1m5x",
          "cascadeDelete": false,
          "minSelect": null,
          "maxSelect": 1,
          "displayFields": null
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
