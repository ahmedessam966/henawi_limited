/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("q23tm1x11vzw6to");

  return dao.deleteCollection(collection);
}, (db) => {
  const collection = new Collection({
    "id": "q23tm1x11vzw6to",
    "created": "2023-09-30 12:41:59.481Z",
    "updated": "2023-09-30 13:54:46.940Z",
    "name": "Staff",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "rlew2zvc",
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
      },
      {
        "system": false,
        "id": "0fbto5cf",
        "name": "Email",
        "type": "email",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "exceptDomains": [],
          "onlyDomains": []
        }
      },
      {
        "system": false,
        "id": "xnjrxlvi",
        "name": "Phone",
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
        "id": "1qtiorh5",
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
      },
      {
        "system": false,
        "id": "g4xg03le",
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
        "id": "ortsqpnb",
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
        "id": "ed66tsk9",
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
        "id": "yq2udua1",
        "name": "Insurance_Class",
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
        "id": "cww1spbi",
        "name": "Insurance_Validity",
        "type": "date",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "min": "2023-09-30 12:00:00.000Z",
          "max": "2030-09-30 12:00:00.000Z"
        }
      },
      {
        "system": false,
        "id": "a9b5iwct",
        "name": "Salary",
        "type": "number",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "min": 1000,
          "max": 100000,
          "noDecimal": true
        }
      },
      {
        "system": false,
        "id": "af4i1qao",
        "name": "Position",
        "type": "select",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "maxSelect": 1,
          "values": [
            "IT Auditor",
            "IT Admin",
            "Accountant",
            "Store Clerk",
            "Procurements Agent",
            "Delivery",
            "Branch Manager"
          ]
        }
      },
      {
        "system": false,
        "id": "jh4ielpt",
        "name": "Privilege_Level",
        "type": "text",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "min": 1,
          "max": 2,
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
