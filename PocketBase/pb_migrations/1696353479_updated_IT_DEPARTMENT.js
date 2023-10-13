/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("v4tzc3596n99qn3")

  collection.listRule = "@collection.StaffAuth.Position = \"HR Manager\" || @collection.StaffAuth.Position = \"HR Agent\" || @collection.StaffAuth.Position = \"Recruiter\" || @collection.StaffAuth.Position = \"CEO\" || @collection.StaffAuth.Position = \"CFO\" || @collection.StaffAuth.Position = \"IT Auditor\" || @collection.StaffAuth.Position = \"IT Admin\""
  collection.viewRule = "@collection.StaffAuth.Position = \"HR Manager\" || @collection.StaffAuth.Position = \"HR Agent\" || @collection.StaffAuth.Position = \"Recruiter\" || @collection.StaffAuth.Position = \"CEO\" || @collection.StaffAuth.Position = \"CFO\" || @collection.StaffAuth.Position = \"IT Auditor\" || @collection.StaffAuth.Position = \"IT Admin\""
  collection.createRule = "@collection.StaffAuth.Position = \"HR Manager\" || @collection.StaffAuth.Position = \"HR Agent\" || @collection.StaffAuth.Position = \"Recruiter\" || @collection.StaffAuth.Position = \"CEO\" || @collection.StaffAuth.Position = \"CFO\" || @collection.StaffAuth.Position = \"IT Auditor\" || @collection.StaffAuth.Position = \"IT Admin\""
  collection.updateRule = "@collection.StaffAuth.Position = \"HR Manager\" || @collection.StaffAuth.Position = \"HR Agent\" || @collection.StaffAuth.Position = \"Recruiter\" || @collection.StaffAuth.Position = \"CEO\" || @collection.StaffAuth.Position = \"CFO\" || @collection.StaffAuth.Position = \"IT Auditor\" || @collection.StaffAuth.Position = \"IT Admin\""
  collection.deleteRule = "@collection.StaffAuth.Position = \"HR Manager\" || @collection.StaffAuth.Position = \"HR Agent\" || @collection.StaffAuth.Position = \"Recruiter\" || @collection.StaffAuth.Position = \"CEO\" || @collection.StaffAuth.Position = \"CFO\" || @collection.StaffAuth.Position = \"IT Auditor\" || @collection.StaffAuth.Position = \"IT Admin\""

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("v4tzc3596n99qn3")

  collection.listRule = null
  collection.viewRule = null
  collection.createRule = null
  collection.updateRule = null
  collection.deleteRule = null

  return dao.saveCollection(collection)
})
