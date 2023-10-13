/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("2p14nim7qe1mffe")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "o728cx7f",
    "name": "Staff_ID",
    "type": "text",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": 1,
      "max": null,
      "pattern": ""
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("2p14nim7qe1mffe")

  // remove
  collection.schema.removeField("o728cx7f")

  return dao.saveCollection(collection)
})
