# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
categories = ['chinese','korean','american','thai','indian','polish','russian','german','italian','french']

Category.delete_all
categories.each do |cat|
	Category.create!(:name => cat)
end

