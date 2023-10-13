/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("57e894z8itiutpb")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "xnv7oon8",
    "name": "Salary",
    "type": "number",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": 100,
      "max": 100000,
      "noDecimal": true
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "a9ork3bp",
    "name": "Gender",
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
    "id": "bp8x7ce4",
    "name": "Age",
    "type": "number",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": 10,
      "max": 100,
      "noDecimal": true
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("57e894z8itiutpb")

  // remove
  collection.schema.removeField("xnv7oon8")

  // remove
  collection.schema.removeField("a9ork3bp")

  // remove
  collection.schema.removeField("bp8x7ce4")

  return dao.saveCollection(collection)
})
