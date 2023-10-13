/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("q23tm1x11vzw6to")

  // add
  collection.schema.addField(new SchemaField({
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
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("q23tm1x11vzw6to")

  // remove
  collection.schema.removeField("jh4ielpt")

  return dao.saveCollection(collection)
})
