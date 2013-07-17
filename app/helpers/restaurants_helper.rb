module RestaurantsHelper
	def category_link_list(categories)
		categories.map { |cat| link_to "#{cat.titleized_name} (#{cat.restaurants.count})", category_path(cat) }.join("---").html_safe
  	end
end
