require 'test_helper'

class OwnersControllerTest < ActionController::TestCase

	#makes sure all restaurants for a controller are pulled out
	test "redirect when owner not logged in" do
		get :dashboard
		assert_redirected_to :new_owner_session
	end

	test "show the dashboard when owner logged in " do 	
		
		@owner = Owner.create name: "Josh", email: "joshua.gudjohnsen@gmail.com", password: "password123", password_confirmation: "password123"

		sign_in @owner
		
		get :dashboard

		assert_response :success

	end

end
