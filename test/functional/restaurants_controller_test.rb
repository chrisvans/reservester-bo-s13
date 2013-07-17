require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase

	# setup do
	# 	@restaurant = restaurants(:one)
	# 	@owner = Owner.create!( 
	# 		email: 'owner@example.com',
	# 		password: 'MyPassword',
	# 		password_confirmation: 'MyPassword'
	# 		)
	# 	sign_in @owner
	# end

	test "controller fails" do 
		get :show, :id => 1 
		assert_response :not_found 
	end

	test "testing that a restaurant is shown" do 
		restaurant = FactoryGirl.create(:restaurant)
		get :show, :id => restaurant.id 
		assert_response :success
	end

	test "restaurant is saved to the database" do 
		owner = FactoryGirl.create(:owner)
		assert_difference('Restaurant.count', 1) do 
			post :create, :owner_id => owner.id, :restaurant => {name: "new restaurant"}
		end
		assert_redirected_to restaurant_path(assigns(:restaurant))
	end



# 	test "should get index" do 
# 		get :index
# 		assert_response :success
# 		assert_not_nil assigns(:restaurants)  
# 	end

# 	test "should show restaurant" do 
# 		get :show, id: @restaurant
# 		assert_response :success
# 	end 

# 	test "should get new" do 
# 		get :new
# 		assert_response :success
# 		assert_not_nil assigns(:restaurant)
# 	end 

# 	# tests the create controller action
# 	test "should create new restaurant" do 
# 		assert_difference('Restaurant.count') do 
# 			post :create, restaurant: { name: "some name" }
# 		end

# 		assert_redirected_to restaurant_path(assigns(:restaurant)) 
# 	end 

# 	test "should update restaurant" do 
# 		put :update, id: @restaurant, restaurant: { } 
# 		assert_redirected_to restaurant_path(assigns(:restaurant))
# 	end

# 	test "should get edit" do 
# 		get :edit, id: @restaurant
# 		assert_response :success
# 		assert_not_nil assigns(:restaurant)
# 	end

# 	test "should destroy a restaurant" do 		
# 		assert_difference('Restaurant.count', -1) do 
# 			delete :destroy, id: @restaurant
# 		end
# 		assert_redirected_to restaurants_path
# 	end

end
