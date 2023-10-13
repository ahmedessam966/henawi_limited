/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("u60zl53zdwo465y")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "mcamj4xj",
    "name": "Created_By",
    "type": "text",
    "required": true,
    "presentable": false,
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
  const collection = dao.findCollectionByNameOrId("u60zl53zdwo465y")

  // remove
  collection.schema.removeField("mcamj4xj")

  return dao.saveCollection(collection)
})
