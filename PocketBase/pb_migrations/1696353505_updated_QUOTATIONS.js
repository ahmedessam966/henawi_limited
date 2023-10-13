/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("u60zl53zdwo465y")

  collection.updateRule = "@collection.StaffAuth.Privilege_Level <= 3"
  collection.deleteRule = "@collection.StaffAuth.Privilege_Level <= 3"

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("u60zl53zdwo465y")

  collection.updateRule = "@collection.StaffAuth.Privilege_Level = 3"
  collection.deleteRule = "@collection.StaffAuth.Privilege_Level = 3"

  return dao.saveCollection(collection)
})
