/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("u6ovliwoxr9vm8y")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "hycuko0m",
    "name": "Month_Total",
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

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "fm9ngnbb",
    "name": "Month",
    "type": "json",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {}
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("u6ovliwoxr9vm8y")

  // remove
  collection.schema.removeField("hycuko0m")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "fm9ngnbb",
    "name": "Date",
    "type": "json",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {}
  }))

  return dao.saveCollection(collection)
})
