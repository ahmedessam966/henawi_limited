/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("fg4ozwutr1pha4r")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "pogonqqn",
    "name": "Available_Stock",
    "type": "number",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": 1,
      "max": null,
      "noDecimal": true
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("fg4ozwutr1pha4r")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "pogonqqn",
    "name": "Quantity",
    "type": "number",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": 1,
      "max": null,
      "noDecimal": true
    }
  }))

  return dao.saveCollection(collection)
})
