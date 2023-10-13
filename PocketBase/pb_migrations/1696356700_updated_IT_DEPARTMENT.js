/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("v4tzc3596n99qn3")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "8rrnujho",
    "name": "Name",
    "type": "text",
    "required": true,
    "presentable": true,
    "unique": false,
    "options": {
      "min": 2,
      "max": null,
      "pattern": ""
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("v4tzc3596n99qn3")

  // remove
  collection.schema.removeField("8rrnujho")

  return dao.saveCollection(collection)
})
