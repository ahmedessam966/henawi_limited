/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("u6ovliwoxr9vm8y")

  // remove
  collection.schema.removeField("u3tj0giv")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "mfzxnxyz",
    "name": "field",
    "type": "number",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": 1,
      "max": 12,
      "noDecimal": true
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("u6ovliwoxr9vm8y")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "u3tj0giv",
    "name": "Month",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
        "11",
        "12"
      ]
    }
  }))

  // remove
  collection.schema.removeField("mfzxnxyz")

  return dao.saveCollection(collection)
})
