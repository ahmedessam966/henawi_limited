/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("2p14nim7qe1mffe")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "ynv4ovye",
    "name": "Name",
    "type": "text",
    "required": true,
    "presentable": true,
    "unique": false,
    "options": {
      "min": null,
      "max": null,
      "pattern": ""
    }
  }))

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "nsfjo1xb",
    "name": "ID_Number",
    "type": "text",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": 5,
      "max": null,
      "pattern": ""
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("2p14nim7qe1mffe")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "ynv4ovye",
    "name": "Name",
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

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "nsfjo1xb",
    "name": "ID_Number",
    "type": "text",
    "required": true,
    "presentable": true,
    "unique": false,
    "options": {
      "min": 5,
      "max": null,
      "pattern": ""
    }
  }))

  return dao.saveCollection(collection)
})
