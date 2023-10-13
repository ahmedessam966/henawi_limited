/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "xwkrbpwbc3vjaly",
    "created": "2023-10-03 17:25:18.305Z",
    "updated": "2023-10-03 17:25:18.305Z",
    "name": "VENDORS",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "g1ccwnlb",
        "name": "Vendor_Name",
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
        "id": "naqkb24y",
        "name": "Vendor_Official_Email",
        "type": "email",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "exceptDomains": [],
          "onlyDomains": []
        }
      },
      {
        "system": false,
        "id": "ykjhq3tb",
        "name": "Vendor_Balance",
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
  const collection = dao.findCollectionByNameOrId("xwkrbpwbc3vjaly");

  return dao.deleteCollection(collection);
})
