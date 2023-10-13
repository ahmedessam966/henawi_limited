/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("fg4ozwutr1pha4r")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "1fquwngm",
    "name": "Product_Category",
    "type": "select",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "maxSelect": 1,
      "values": [
        "Printer",
        "Notebook",
        "Desktop PC",
        "Keyboard/Mouse",
        "Accessory",
        "Server",
        "Router",
        "Switch",
        "Modem",
        "Cable",
        "Rack",
        "Software",
        "Firewall",
        "CCTV Camera",
        "Access Control",
        "Access Point",
        "Plotter"
      ]
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("fg4ozwutr1pha4r")

  // remove
  collection.schema.removeField("1fquwngm")

  return dao.saveCollection(collection)
})
