/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("yd7xkz39716bih8")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "put5xokn",
    "name": "Seen",
    "type": "bool",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {}
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("yd7xkz39716bih8")

  // remove
  collection.schema.removeField("put5xokn")

  return dao.saveCollection(collection)
})
