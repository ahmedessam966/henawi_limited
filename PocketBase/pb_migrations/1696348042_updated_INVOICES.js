/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("qvufo3e3hrp5awl")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "m7igqjwd",
    "name": "Invoice_Type",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "Cash",
        "Deferred"
      ]
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "ysbwvku1",
    "name": "Payment_Terms",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "Cash",
        "30 Days",
        "60 Days",
        "Undefined"
      ]
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("qvufo3e3hrp5awl")

  // remove
  collection.schema.removeField("m7igqjwd")

  // remove
  collection.schema.removeField("ysbwvku1")

  return dao.saveCollection(collection)
})
