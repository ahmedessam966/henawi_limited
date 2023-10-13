/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("rodlddr5xym1m5x")

  // remove
  collection.schema.removeField("quchykke")

  // remove
  collection.schema.removeField("mfyvzco5")

  // remove
  collection.schema.removeField("zbssy9yp")

  // remove
  collection.schema.removeField("aujdnuij")

  // remove
  collection.schema.removeField("o9m9leay")

  // remove
  collection.schema.removeField("bh6glncd")

  // remove
  collection.schema.removeField("eyzw2ose")

  // remove
  collection.schema.removeField("yhnca6ur")

  // remove
  collection.schema.removeField("nvqcobkn")

  // remove
  collection.schema.removeField("9k6lal9a")

  // remove
  collection.schema.removeField("rfpwo4lh")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "fkwjktol",
    "name": "Reference",
    "type": "relation",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "collectionId": "2p14nim7qe1mffe",
      "cascadeDelete": true,
      "minSelect": null,
      "maxSelect": 1,
      "displayFields": null
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("rodlddr5xym1m5x")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "quchykke",
    "name": "Email",
    "type": "email",
    "required": true,
    "presentable": true,
    "unique": false,
    "options": {
      "exceptDomains": [],
      "onlyDomains": []
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "mfyvzco5",
    "name": "Age",
    "type": "number",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": 10,
      "max": 100,
      "noDecimal": true
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "zbssy9yp",
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
    "id": "aujdnuij",
    "name": "Phone",
    "type": "text",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": 10,
      "max": 14,
      "pattern": ""
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "o9m9leay",
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
    "id": "bh6glncd",
    "name": "Profile_Image",
    "type": "file",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "maxSize": 5242880,
      "mimeTypes": [
        "image/png",
        "image/vnd.mozilla.apng",
        "image/jpeg",
        "image/bmp",
        "image/x-icon",
        "image/x-icns",
        "image/heic",
        "image/heic-sequence",
        "image/heif",
        "image/heif-sequence",
        "image/vnd.radiance"
      ],
      "thumbs": [],
      "protected": false
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "eyzw2ose",
    "name": "ID_Type",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "Work Visa",
        "Local ID",
        "Passport",
        "Temporary Visa"
      ]
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "yhnca6ur",
    "name": "ID_Number",
    "type": "text",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": 5,
      "max": 20,
      "pattern": ""
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "nvqcobkn",
    "name": "Nationality",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "Egypt",
        "Saudi Arabia",
        "United Arab Emirates",
        "Pakistan",
        "Afghanistan",
        "Bangladesh",
        "India",
        "Philippines",
        "Tunisia",
        "Morocco",
        "Algeria",
        "Sudan",
        "Ethiopia",
        "Chad",
        "Somalia",
        "Libya",
        "China",
        "United States of America",
        "Qatar",
        "Kuwait",
        "Jordan",
        "Palestine",
        "Syria",
        "Lebanon",
        "Oman",
        "Nigeria",
        "France",
        "Germany",
        "South Korea",
        "North Korea",
        "Japan",
        "Italy",
        "Sweden",
        "Norway",
        "Finland",
        "Spain",
        "England",
        "Scotland",
        "Malaysia",
        "Thailand",
        "Taiwan",
        "Tajikistan",
        "Russia",
        "Canada",
        "Mexico",
        "Brazil",
        "Argentina",
        "Portugal"
      ]
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "9k6lal9a",
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
    "id": "rfpwo4lh",
    "name": "Status",
    "type": "bool",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {}
  }))

  // remove
  collection.schema.removeField("fkwjktol")

  return dao.saveCollection(collection)
})
