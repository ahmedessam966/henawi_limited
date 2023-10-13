/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("u60zl53zdwo465y")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "6e5axrnk",
    "name": "Proposition_Type",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "Cash",
        "Deferred"
      ]
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "inxs78rk",
    "name": "Proposed_Terms",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "Cash",
        "30 Days",
        "60 Days",
        "Undefined"
      ]
    }
  }))

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "abbt7iru",
    "name": "Proposal_Breakdown",
    "type": "json",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {}
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("u60zl53zdwo465y")

  // remove
  collection.schema.removeField("6e5axrnk")

  // remove
  collection.schema.removeField("inxs78rk")

  // update
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "abbt7iru",
    "name": "Requisition",
    "type": "json",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {}
  }))

  return dao.saveCollection(collection)
})
