/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("u6ovliwoxr9vm8y")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "mfzxnxyz",
    "name": "Month",
    "type": "number",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": 1,
      "max": 12,
      "noDecimal": true
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("u6ovliwoxr9vm8y")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "mfzxnxyz",
    "name": "field",
    "type": "number",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": 1,
      "max": 12,
      "noDecimal": true
    }
  }))

  return dao.saveCollection(collection)
})
