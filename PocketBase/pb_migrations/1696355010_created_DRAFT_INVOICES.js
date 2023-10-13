/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "xeq1hv9ivuoc65c",
    "created": "2023-10-03 17:43:30.449Z",
    "updated": "2023-10-03 17:43:30.449Z",
    "name": "DRAFT_INVOICES",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "i8xnwddy",
        "name": "Invoice_Number",
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
        "id": "7g4qtw4e",
        "name": "Issued_By",
        "type": "relation",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "collectionId": "rodlddr5xym1m5x",
          "cascadeDelete": false,
          "minSelect": null,
          "maxSelect": 1,
          "displayFields": null
        }
      },
      {
        "system": false,
        "id": "6yiqbx2n",
        "name": "Invoice_Total",
        "type": "number",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "min": 1,
          "max": null,
          "noDecimal": false
        }
      },
      {
        "system": false,
        "id": "ibrskvuh",
        "name": "Invoice_Date",
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
        "id": "dsd2ryu0",
        "name": "Invoice_Breakdown",
        "type": "json",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {}
      },
      {
        "system": false,
        "id": "zqernzac",
        "name": "Invoice_Type",
        "type": "select",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "maxSelect": 1,
          "values": [
            "Cash",
            "Deferred"
          ]
        }
      },
      {
        "system": false,
        "id": "6pg3rlnt",
        "name": "Payment_Terms",
        "type": "select",
        "required": true,
        "presentable": false,
        "unique": false,
        "options": {
          "maxSelect": 1,
          "values": [
            "Cash",
            "30 Days",
            "60 Days",
            "Undefined"
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
  const collection = dao.findCollectionByNameOrId("xeq1hv9ivuoc65c");

  return dao.deleteCollection(collection);
})
