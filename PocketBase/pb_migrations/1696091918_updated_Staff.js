/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("57e894z8itiutpb")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "1ppyzlna",
    "name": "Position",
    "type": "text",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": null,
      "max": null,
      "pattern": ""
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("57e894z8itiutpb")

  // remove
  collection.schema.removeField("1ppyzlna")

  return dao.saveCollection(collection)
})
