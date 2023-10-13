/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("rodlddr5xym1m5x")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "svfgncye",
    "name": "Sales_Breakdown",
    "type": "json",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {}
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("rodlddr5xym1m5x")

  // remove
  collection.schema.removeField("svfgncye")

  return dao.saveCollection(collection)
})
