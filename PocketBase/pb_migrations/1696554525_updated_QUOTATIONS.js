/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("u60zl53zdwo465y")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "i9gxcsx8",
    "name": "Client",
    "type": "relation",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "collectionId": "aphxpeuw72gjdzv",
      "cascadeDelete": true,
      "minSelect": null,
      "maxSelect": 1,
      "displayFields": null
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "qsi3rzl4",
    "name": "Quotation_Total",
    "type": "number",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": 1,
      "max": null,
      "noDecimal": false
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("u60zl53zdwo465y")

  // remove
  collection.schema.removeField("i9gxcsx8")

  // remove
  collection.schema.removeField("qsi3rzl4")

  return dao.saveCollection(collection)
})
