/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("aphxpeuw72gjdzv")

  collection.updateRule = "@collection.StaffAuth.Privilege_Level <= 3"
  collection.deleteRule = "@collection.StaffAuth.Privilege_Level <= 2"

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("aphxpeuw72gjdzv")

  collection.updateRule = null
  collection.deleteRule = ""

  return dao.saveCollection(collection)
})
