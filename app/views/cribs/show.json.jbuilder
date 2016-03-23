json.data do
	json.attributes do
		json.name @crib.name
		json.length @crib.length
		json.bredth @crib.bredth
		json.location @crib.location
	end

	json.relationships do
		json.owner do
			json.id @crib.owner.id
			json.name @crib.owner.name
			json.email @crib.owner.email
			json.links do
				json.self owner_url(@crib.owner)
				json.cribs owner_cribs_url(@crib.owner)
			end
		end

		json.tenants @crib.tenants do |t|
			json.id t.id
			json.name t.name
			json.age t.age
			json.email t.email
			json.links do
				json.self tenant_url
			end
		end
	end
end
