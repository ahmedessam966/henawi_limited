/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("u6ovliwoxr9vm8y")

  // remove
  collection.schema.removeField("v90jp0ze")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "gnjurgpf",
    "name": "Date",
    "type": "date",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": "2020-01-01 12:00:00.000Z",
      "max": "2023-10-31 12:00:00.000Z"
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("u6ovliwoxr9vm8y")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "v90jp0ze",
    "name": "Month",
    "type": "text",
    "required": true,
    "presentable": true,
    "unique": false,
    "options": {
      "min": 3,
      "max": null,
      "pattern": ""
    }
  }))

  // remove
  collection.schema.removeField("gnjurgpf")

  return dao.saveCollection(collection)
})
