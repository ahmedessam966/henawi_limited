/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("2p14nim7qe1mffe")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "gecocyjk",
    "name": "Gender",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "Male",
        "Female"
      ]
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "scdf2fm8",
    "name": "Marital_Status",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "Married",
        "Single"
      ]
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "j9zf4l3p",
    "name": "ID_Type",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "Passport",
        "Work Visa",
        "Temporary Visa",
        "Local ID"
      ]
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "nsfjo1xb",
    "name": "ID_Number",
    "type": "text",
    "required": true,
    "presentable": true,
    "unique": false,
    "options": {
      "min": 5,
      "max": null,
      "pattern": ""
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "6kssvdym",
    "name": "Salary",
    "type": "number",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": 100,
      "max": 100000,
      "noDecimal": false
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "e1595imu",
    "name": "Insurance_Agent",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "Axxa",
        "BUPA",
        "Allianz",
        "MedioCare",
        "N/A"
      ]
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "bm8qrdbw",
    "name": "Insurance_Class",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "A",
        "B",
        "C"
      ]
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "blny6xkv",
    "name": "Insurance_Validity",
    "type": "date",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": "",
      "max": ""
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "h4uxgxdo",
    "name": "Status",
    "type": "bool",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {}
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("2p14nim7qe1mffe")

  // remove
  collection.schema.removeField("gecocyjk")

  // remove
  collection.schema.removeField("scdf2fm8")

  // remove
  collection.schema.removeField("j9zf4l3p")

  // remove
  collection.schema.removeField("nsfjo1xb")

  // remove
  collection.schema.removeField("6kssvdym")

  // remove
  collection.schema.removeField("e1595imu")

  // remove
  collection.schema.removeField("bm8qrdbw")

  // remove
  collection.schema.removeField("blny6xkv")

  // remove
  collection.schema.removeField("h4uxgxdo")

  return dao.saveCollection(collection)
})
