/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "v4tzc3596n99qn3",
    "created": "2023-10-03 15:09:32.740Z",
    "updated": "2023-10-03 15:09:32.740Z",
    "name": "IT_PERSONNEL",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "owmfrw4x",
        "name": "Name",
        "type": "text",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "min": 1,
          "max": null,
          "pattern": ""
        }
      },
      {
        "system": false,
        "id": "yf50x6zl",
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
        "id": "egvbezls",
        "name": "Phone",
        "type": "text",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "min": 10,
          "max": 14,
          "pattern": ""
        }
      },
      {
        "system": false,
        "id": "9qimdrzb",
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
        "id": "xdx9ykcl",
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
        "id": "1ohvowfb",
        "name": "Insurance_Validity",
        "type": "date",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "min": "2023-10-04 12:00:00.000Z",
          "max": "2026-10-01 12:00:00.000Z"
        }
      },
      {
        "system": false,
        "id": "h9zybrva",
        "name": "Profile_Image",
        "type": "file",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "maxSelect": 1,
          "maxSize": 5242880,
          "mimeTypes": [
            "image/vnd.mozilla.apng",
            "image/jpeg",
            "image/png",
            "image/bmp",
            "image/heic-sequence",
            "image/heic",
            "image/heif",
            "image/heif-sequence",
            "image/vnd.radiance",
            "image/x-icns"
          ],
          "thumbs": [],
          "protected": false
        }
      },
      {
        "system": false,
        "id": "fnj3rbll",
        "name": "Salary",
        "type": "number",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "min": 100,
          "max": 100000,
          "noDecimal": false
        }
      },
      {
        "system": false,
        "id": "v2d83422",
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
        "id": "ew6bp37o",
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
  const collection = dao.findCollectionByNameOrId("v4tzc3596n99qn3");

  return dao.deleteCollection(collection);
})
