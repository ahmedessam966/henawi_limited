/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("q23tm1x11vzw6to")

  // remove
  collection.schema.removeField("zfn0aslx")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "ortsqpnb",
    "name": "Gender",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "Male",
        "Female"
      ]
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("q23tm1x11vzw6to")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "zfn0aslx",
    "name": "Insurance_Details",
    "type": "json",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {}
  }))

  // remove
  collection.schema.removeField("ortsqpnb")

  return dao.saveCollection(collection)
})
