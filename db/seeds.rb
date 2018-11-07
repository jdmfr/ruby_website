# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(2...100).each do |index|
	product={
		id: index,
		title:  if index%3==0
						"katou_megumi"
					elsif index%3==1
						"1eriri"
						else
							"wutaha" 
						end,
				 
		price: 10.00,
		catagory_id: (index%3+1), 
		provider_id: (index%3+1),
	}
	Product.create(product)
end