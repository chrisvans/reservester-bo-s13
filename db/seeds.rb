# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
# 
  Category.delete_all

  categories = Category.create([
  	{ name: 'American' }, 
  	{ name: 'French' }, 
  	{ name: 'Japanese' },
  	{ name: 'Asian' },
  	{ name: 'European' },
  	{ name: 'Mexican' },
  	{ name: 'Breakfast' },
  	{ name: 'Lunch' },
  	{ name: 'Dinner' },
  	{ name: 'Formal' },
  	{ name: 'Casual' }
  	])
#   Mayor.create(name: 'Emanuel', city: cities.first)
