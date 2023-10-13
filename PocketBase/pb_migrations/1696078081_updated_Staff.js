/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("q23tm1x11vzw6to")

  // add
  collection.schema.addField(new SchemaField({
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
  }))

  // add
  collection.schema.addField(new SchemaField({
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
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("q23tm1x11vzw6to")

  // remove
  collection.schema.removeField("a9b5iwct")

  // remove
  collection.schema.removeField("af4i1qao")

  return dao.saveCollection(collection)
})
