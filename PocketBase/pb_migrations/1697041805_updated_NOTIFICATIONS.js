/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("yd7xkz39716bih8")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "aaup9jvy",
    "name": "Type",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "Assignment",
        "Acknowledgment",
        "Request"
      ]
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("yd7xkz39716bih8")

  // remove
  collection.schema.removeField("aaup9jvy")

  return dao.saveCollection(collection)
})
