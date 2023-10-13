/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "rodlddr5xym1m5x",
    "created": "2023-10-03 15:16:09.722Z",
    "updated": "2023-10-03 15:16:09.722Z",
    "name": "SALES_DEPARTMENT",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "gyznc1dj",
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
        "id": "quchykke",
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
        "id": "mfyvzco5",
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
        "id": "zbssy9yp",
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
        "id": "aujdnuij",
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
        "id": "o9m9leay",
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
        "id": "bh6glncd",
        "name": "Profile_Image",
        "type": "file",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "maxSelect": 1,
          "maxSize": 5242880,
          "mimeTypes": [
            "image/png",
            "image/vnd.mozilla.apng",
            "image/jpeg",
            "image/bmp",
            "image/x-icon",
            "image/x-icns",
            "image/heic",
            "image/heic-sequence",
            "image/heif",
            "image/heif-sequence",
            "image/vnd.radiance"
          ],
          "thumbs": [],
          "protected": false
        }
      },
      {
        "system": false,
        "id": "eyzw2ose",
        "name": "ID_Type",
        "type": "select",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "maxSelect": 1,
          "values": [
            "Work Visa",
            "Local ID",
            "Passport",
            "Temporary Visa"
          ]
        }
      },
      {
        "system": false,
        "id": "yhnca6ur",
        "name": "ID_Number",
        "type": "text",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "min": 5,
          "max": 20,
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
  const collection = dao.findCollectionByNameOrId("rodlddr5xym1m5x");

  return dao.deleteCollection(collection);
})
