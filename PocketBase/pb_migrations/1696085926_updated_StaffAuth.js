/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("2p14nim7qe1mffe")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "oubjnlya",
    "name": "Privilege_Level",
    "type": "number",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": 1,
      "max": 10,
      "noDecimal": true
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("2p14nim7qe1mffe")

  // remove
  collection.schema.removeField("oubjnlya")

  return dao.saveCollection(collection)
})
