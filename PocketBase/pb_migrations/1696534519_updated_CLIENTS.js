/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("aphxpeuw72gjdzv")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "t5ptpyf4",
    "name": "Invoices",
    "type": "relation",
    "required": true,
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
  const collection = dao.findCollectionByNameOrId("aphxpeuw72gjdzv")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "t5ptpyf4",
    "name": "Invoices",
    "type": "relation",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "collectionId": "qvufo3e3hrp5awl",
      "cascadeDelete": false,
      "minSelect": null,
      "maxSelect": 1,
      "displayFields": null
    }
  }))

  return dao.saveCollection(collection)
})
