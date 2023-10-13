/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "awnpb7k1g9gtdp3",
    "created": "2023-09-30 12:38:57.382Z",
    "updated": "2023-09-30 12:38:57.382Z",
    "name": "staff",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "icrztrvs",
        "name": "Staff_ID",
        "type": "text",
        "required": true,
        "presentable": true,
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
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("awnpb7k1g9gtdp3");

  return dao.deleteCollection(collection);
})
