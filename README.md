This is a project to help me better understand the RESTful API. Learning to build APIs with good HTTP responses and convention.

Owner has_many Cribs
Crib has_many Tenants | belongs_to # Owner
Tenant belongs_to Crib,

## Getting the collection or Cribs in the DB
`GET http://YOUR_URL/cribs/` returns JSON

## Getting the details of a Crib:
`GET http://YOUR_URL/cribs/:id` returns JSON
