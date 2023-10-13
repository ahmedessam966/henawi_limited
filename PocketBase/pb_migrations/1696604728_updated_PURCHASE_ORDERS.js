/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("ruy61m5bgqma9i8")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "lm3s1tk8",
    "name": "Status",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "Pending",
        "Processed",
        "Rejected"
      ]
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("ruy61m5bgqma9i8")

  // remove
  collection.schema.removeField("lm3s1tk8")

  return dao.saveCollection(collection)
})
