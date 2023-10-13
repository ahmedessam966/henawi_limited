/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("qvufo3e3hrp5awl")

  // remove
  collection.schema.removeField("aeta2c71")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "li0pw6f5",
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
  const collection = dao.findCollectionByNameOrId("qvufo3e3hrp5awl")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "aeta2c71",
    "name": "Issued_By",
    "type": "relation",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "collectionId": "2p14nim7qe1mffe",
      "cascadeDelete": false,
      "minSelect": null,
      "maxSelect": 1,
      "displayFields": null
    }
  }))

  // remove
  collection.schema.removeField("li0pw6f5")

  return dao.saveCollection(collection)
})
