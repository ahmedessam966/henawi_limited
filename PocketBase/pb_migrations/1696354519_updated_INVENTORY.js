/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("fg4ozwutr1pha4r")

  collection.listRule = ""
  collection.viewRule = ""
  collection.createRule = "@collection.StaffAuth.Position != \"Sales Agent\" || @collection.StaffAuth.Position != \"Sales Manager\" || @collection.StaffAuth.Position != \"HR Recruiter\" || @collection.StaffAuth.Position != \"HR Manager\" || @collection.StaffAuth.Position != \"HR Agent\""
  collection.updateRule = "@collection.StaffAuth.Position != \"Sales Agent\" || @collection.StaffAuth.Position != \"Sales Manager\" || @collection.StaffAuth.Position != \"HR Recruiter\" || @collection.StaffAuth.Position != \"HR Manager\" || @collection.StaffAuth.Position != \"HR Agent\""
  collection.deleteRule = "@collection.StaffAuth.Position != \"Sales Agent\" || @collection.StaffAuth.Position != \"Sales Manager\" || @collection.StaffAuth.Position != \"HR Recruiter\" || @collection.StaffAuth.Position != \"HR Manager\" || @collection.StaffAuth.Position != \"HR Agent\""

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("fg4ozwutr1pha4r")

  collection.listRule = null
  collection.viewRule = null
  collection.createRule = null
  collection.updateRule = null
  collection.deleteRule = null

  return dao.saveCollection(collection)
})
