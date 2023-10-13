/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("qvufo3e3hrp5awl")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "noz9l0ua",
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
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("qvufo3e3hrp5awl")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "noz9l0ua",
    "name": "Invoice_Total",
    "type": "number",
    "required": true,
    "presentable": true,
    "unique": false,
    "options": {
      "min": 1,
      "max": null,
      "noDecimal": false
    }
  }))

  return dao.saveCollection(collection)
})
