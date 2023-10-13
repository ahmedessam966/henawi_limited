/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("rodlddr5xym1m5x")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "nvqcobkn",
    "name": "Nationality",
    "type": "select",
    "required": false,
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

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("rodlddr5xym1m5x")

  // remove
  collection.schema.removeField("nvqcobkn")

  return dao.saveCollection(collection)
})
