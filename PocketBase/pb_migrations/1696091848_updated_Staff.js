/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("57e894z8itiutpb")

  // remove
  collection.schema.removeField("2ojgm4ce")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "pcoxmrog",
    "name": "Name",
    "type": "text",
    "required": true,
    "presentable": true,
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

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "2ojgm4ce",
    "name": "Name",
    "type": "editor",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "convertUrls": false
    }
  }))

  // remove
  collection.schema.removeField("pcoxmrog")

  return dao.saveCollection(collection)
})
