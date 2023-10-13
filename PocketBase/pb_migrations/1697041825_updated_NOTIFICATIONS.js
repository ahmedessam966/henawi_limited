/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("yd7xkz39716bih8")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "v2hovhbi",
    "name": "Receiver",
    "type": "relation",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "collectionId": "2p14nim7qe1mffe",
      "cascadeDelete": true,
      "minSelect": null,
      "maxSelect": null,
      "displayFields": null
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("yd7xkz39716bih8")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "v2hovhbi",
    "name": "Receiver",
    "type": "relation",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "collectionId": "2p14nim7qe1mffe",
      "cascadeDelete": true,
      "minSelect": null,
      "maxSelect": 1,
      "displayFields": null
    }
  }))

  return dao.saveCollection(collection)
})
