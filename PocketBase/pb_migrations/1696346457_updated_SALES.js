/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("u73a4l4b57oz68d")

  // remove
  collection.schema.removeField("ziclzizf")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "h1aagirs",
    "name": "September_2023",
    "type": "relation",
    "required": true,
    "presentable": true,
    "unique": false,
    "options": {
      "collectionId": "rodlddr5xym1m5x",
      "cascadeDelete": false,
      "minSelect": null,
      "maxSelect": null,
      "displayFields": null
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("u73a4l4b57oz68d")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "ziclzizf",
    "name": "September_2023",
    "type": "json",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {}
  }))

  // remove
  collection.schema.removeField("h1aagirs")

  return dao.saveCollection(collection)
})
