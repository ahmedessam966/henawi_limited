/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "u6ovliwoxr9vm8y",
    "created": "2023-10-03 15:25:39.254Z",
    "updated": "2023-10-03 15:25:39.254Z",
    "name": "SALES",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "fm9ngnbb",
        "name": "September_2023",
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
  const collection = dao.findCollectionByNameOrId("u6ovliwoxr9vm8y");

  return dao.deleteCollection(collection);
})
