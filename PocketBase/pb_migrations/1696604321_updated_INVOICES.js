/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("qvufo3e3hrp5awl")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "duptokrr",
    "name": "Purchase_Order",
    "type": "relation",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "collectionId": "ruy61m5bgqma9i8",
      "cascadeDelete": false,
      "minSelect": null,
      "maxSelect": 1,
      "displayFields": null
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("qvufo3e3hrp5awl")

  // remove
  collection.schema.removeField("duptokrr")

  return dao.saveCollection(collection)
})
