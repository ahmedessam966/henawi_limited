/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("rodlddr5xym1m5x")

  // remove
  collection.schema.removeField("svfgncye")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "q7xqfwx9",
    "name": "Sales",
    "type": "relation",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "collectionId": "qvufo3e3hrp5awl",
      "cascadeDelete": true,
      "minSelect": null,
      "maxSelect": null,
      "displayFields": null
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
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

  // remove
  collection.schema.removeField("q7xqfwx9")

  return dao.saveCollection(collection)
})
