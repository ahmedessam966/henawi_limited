/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("xeq1hv9ivuoc65c")

  // remove
  collection.schema.removeField("7g4qtw4e")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "tyxkwtke",
    "name": "Issued_By",
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
  const collection = dao.findCollectionByNameOrId("xeq1hv9ivuoc65c")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "7g4qtw4e",
    "name": "Issued_By",
    "type": "relation",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "collectionId": "rodlddr5xym1m5x",
      "cascadeDelete": false,
      "minSelect": null,
      "maxSelect": 1,
      "displayFields": null
    }
  }))

  // remove
  collection.schema.removeField("tyxkwtke")

  return dao.saveCollection(collection)
})
