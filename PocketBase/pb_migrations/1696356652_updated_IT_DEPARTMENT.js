/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("v4tzc3596n99qn3")

  // remove
  collection.schema.removeField("owmfrw4x")

  // remove
  collection.schema.removeField("yf50x6zl")

  // remove
  collection.schema.removeField("egvbezls")

  // remove
  collection.schema.removeField("9qimdrzb")

  // remove
  collection.schema.removeField("xdx9ykcl")

  // remove
  collection.schema.removeField("1ohvowfb")

  // remove
  collection.schema.removeField("h9zybrva")

  // remove
  collection.schema.removeField("fnj3rbll")

  // remove
  collection.schema.removeField("v2d83422")

  // remove
  collection.schema.removeField("ew6bp37o")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "vxbczraf",
    "name": "Reference",
    "type": "relation",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "collectionId": "2p14nim7qe1mffe",
      "cascadeDelete": false,
      "minSelect": null,
      "maxSelect": 1,
      "displayFields": null
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "md2tsc1a",
    "name": "Tickets",
    "type": "json",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {}
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("v4tzc3596n99qn3")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "owmfrw4x",
    "name": "Name",
    "type": "text",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": 1,
      "max": null,
      "pattern": ""
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "yf50x6zl",
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
    "id": "egvbezls",
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
    "id": "9qimdrzb",
    "name": "Insurance_Agent",
    "type": "text",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": null,
      "max": null,
      "pattern": ""
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "xdx9ykcl",
    "name": "Insurance_Class",
    "type": "text",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": null,
      "max": 1,
      "pattern": ""
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "1ohvowfb",
    "name": "Insurance_Validity",
    "type": "date",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": "2023-10-04 12:00:00.000Z",
      "max": "2026-10-01 12:00:00.000Z"
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "h9zybrva",
    "name": "Profile_Image",
    "type": "file",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "maxSize": 5242880,
      "mimeTypes": [
        "image/vnd.mozilla.apng",
        "image/jpeg",
        "image/png",
        "image/bmp",
        "image/heic-sequence",
        "image/heic",
        "image/heif",
        "image/heif-sequence",
        "image/vnd.radiance",
        "image/x-icns"
      ],
      "thumbs": [],
      "protected": false
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "fnj3rbll",
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
    "id": "v2d83422",
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
    "id": "ew6bp37o",
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

  // remove
  collection.schema.removeField("vxbczraf")

  // remove
  collection.schema.removeField("md2tsc1a")

  return dao.saveCollection(collection)
})
