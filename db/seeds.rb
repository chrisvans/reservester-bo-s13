# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# put scategories here

# clear scategories here

Categories.delete_all

categories_list = ["Fast Food", "Fast Casual", "Casual Dining", "Family Style", "Fine Dining", "Bistro", "Buffet", "Cafe", "Coffeehouse", "Pub"]

categories_list.each do |catname|
	Categories.find_or_create_by_name(catname)
end