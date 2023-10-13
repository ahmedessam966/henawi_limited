/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("fg4ozwutr1pha4r")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "nugdkvgk",
    "name": "Requested",
    "type": "number",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": 0,
      "max": null,
      "noDecimal": true
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "uk9skalj",
    "name": "Sold",
    "type": "number",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": 0,
      "max": null,
      "noDecimal": true
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("fg4ozwutr1pha4r")

  // remove
  collection.schema.removeField("nugdkvgk")

  // remove
  collection.schema.removeField("uk9skalj")

  return dao.saveCollection(collection)
})
