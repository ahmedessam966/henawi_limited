/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("qvufo3e3hrp5awl")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "gbqbat3j",
    "name": "Channel",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "Online",
        "Offline"
      ]
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("qvufo3e3hrp5awl")

  // remove
  collection.schema.removeField("gbqbat3j")

  return dao.saveCollection(collection)
})
