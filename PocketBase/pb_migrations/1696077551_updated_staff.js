/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("awnpb7k1g9gtdp3")

  collection.name = "Staff"

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("awnpb7k1g9gtdp3")

  collection.name = "staff"

  return dao.saveCollection(collection)
})
