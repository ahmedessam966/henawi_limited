/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("57e894z8itiutpb")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "6rnhgeef",
    "name": "Privilege",
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
  const collection = dao.findCollectionByNameOrId("57e894z8itiutpb")

  // remove
  collection.schema.removeField("6rnhgeef")

  return dao.saveCollection(collection)
})
