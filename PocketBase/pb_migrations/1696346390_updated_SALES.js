/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("u73a4l4b57oz68d")

  // remove
  collection.schema.removeField("uamnchqq")

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

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("u73a4l4b57oz68d")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "uamnchqq",
    "name": "Personnel_Name",
    "type": "json",
    "required": true,
    "presentable": true,
    "unique": false,
    "options": {}
  }))

  // remove
  collection.schema.removeField("ziclzizf")

  return dao.saveCollection(collection)
})
