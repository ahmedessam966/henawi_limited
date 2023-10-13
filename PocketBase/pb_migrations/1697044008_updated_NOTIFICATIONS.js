/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("yd7xkz39716bih8")

  // remove
  collection.schema.removeField("bzvppvse")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "bqfuqerz",
    "name": "Date",
    "type": "text",
    "required": true,
    "presentable": false,
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
  const collection = dao.findCollectionByNameOrId("yd7xkz39716bih8")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "bzvppvse",
    "name": "Date",
    "type": "date",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": "",
      "max": ""
    }
  }))

  // remove
  collection.schema.removeField("bqfuqerz")

  return dao.saveCollection(collection)
})
