# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

restaurant_categories = [
	"American",
	"African",
	"Asian",
	"Barbeque",
	"Bakery & Deli",
	"Chinese",
	"Pubs",
	"Coffehouses",
	"Continental",
	"Desserts",
	"Distilleries",
	"French",
	"German",
	"Greek",
	"Indian",
	"Italian",
	"Japanese",
	"Mediterranean",
	"Mexican",
	"Middle Eastern",
	"Seafood",
	"Southern Cuisine",
	"Steakhouses",
	"Thai",
	"Vegetarian",
	"Vietnamise",
	"Wine Bars"
]

Category.delete_all

restaurant_categories.each do |name|
	Category.create!(:name => name)
end
