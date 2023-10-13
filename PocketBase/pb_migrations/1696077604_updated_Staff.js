/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("awnpb7k1g9gtdp3")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "kzo7zomi",
    "name": "Email",
    "type": "email",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "exceptDomains": [],
      "onlyDomains": []
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "cxxhpuiv",
    "name": "Phone",
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
    "id": "wxerkzup",
    "name": "asd",
    "type": "relation",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "collectionId": "awnpb7k1g9gtdp3",
      "cascadeDelete": false,
      "minSelect": null,
      "maxSelect": 1,
      "displayFields": null
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("awnpb7k1g9gtdp3")

  // remove
  collection.schema.removeField("kzo7zomi")

  // remove
  collection.schema.removeField("cxxhpuiv")

  // remove
  collection.schema.removeField("wxerkzup")

  return dao.saveCollection(collection)
})
