# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 MyCategories = [
 	"American",
    "Asian, Oriental and Indian",
    "Barbeque",
    "Bakeries",
    "Brew Pubs and Microbreweries",
    "Coffee Houses",
    "Family, Homestyle and Steakhouse Dining",
    "French Restaurants",
    "German Restaurants",
    "Greek Restaurants",
    "Italian Restaurants",
    "Mediterranean Restaurants",
    "Mexican Restaurants",
    "Seafood Restaurants",
    "Southern Cuisine Restaurants",
    "Vegetarian Restaurants",
    "Wine Bars" ]

Categories.delete_all

MyCategories.each do |categories|
  categories.each_line do |category|
    name = category.chomp
    Categories.create!(:name => name)
  end
end


