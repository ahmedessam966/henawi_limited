/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("q23tm1x11vzw6to")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "ed66tsk9",
    "name": "Insurance_Agent",
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

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "yq2udua1",
    "name": "Insurance_Class",
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

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "cww1spbi",
    "name": "Insurance_Validity",
    "type": "date",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": "2023-09-30 12:00:00.000Z",
      "max": "2030-09-30 12:00:00.000Z"
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("q23tm1x11vzw6to")

  // remove
  collection.schema.removeField("ed66tsk9")

  // remove
  collection.schema.removeField("yq2udua1")

  // remove
  collection.schema.removeField("cww1spbi")

  return dao.saveCollection(collection)
})
