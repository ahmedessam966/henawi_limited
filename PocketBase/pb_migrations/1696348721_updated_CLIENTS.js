/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("aphxpeuw72gjdzv")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "4tqmnug6",
    "name": "Quotations",
    "type": "relation",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "collectionId": "u60zl53zdwo465y",
      "cascadeDelete": false,
      "minSelect": 1,
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
    "id": "4tqmnug6",
    "name": "Quotations",
    "type": "relation",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "collectionId": "u60zl53zdwo465y",
      "cascadeDelete": false,
      "minSelect": null,
      "maxSelect": 1,
      "displayFields": null
    }
  }))

  return dao.saveCollection(collection)
})
