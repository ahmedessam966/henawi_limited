/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("v4tzc3596n99qn3")

  collection.name = "IT_DEPARTMENT"

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("v4tzc3596n99qn3")

  collection.name = "IT_PERSONNEL"

  return dao.saveCollection(collection)
})
