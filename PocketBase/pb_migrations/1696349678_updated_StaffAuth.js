/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("2p14nim7qe1mffe")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "udzmkzsi",
    "name": "Position",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "IT Auditor",
        "IT Admin",
        "Procurements Agent",
        "Procurements Manager",
        "Sales Agent",
        "Sales Manager",
        "Accountant",
        "Accountant Manager",
        "Maintenance Technician",
        "Maintenance Manager",
        "Facilities",
        "Branch Manager",
        "CFO",
        "CEO"
      ]
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("2p14nim7qe1mffe")

  // remove
  collection.schema.removeField("udzmkzsi")

  return dao.saveCollection(collection)
})
