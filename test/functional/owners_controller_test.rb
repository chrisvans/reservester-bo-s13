require 'test_helper'

class OwnersControllerTest < ActionController::TestCase
	test "should get dashboard when logged in" do
		@owner = create_and_sign_in_owner
		get :dashboard
		assert_response :success
		assert_not_nil assigns(:restaurants)
	end

	test "should not get dashboard when logged out" do
		get :dashboard
		assert_response :redirect
	end

  private

  def create_and_sign_in_owner
    owner = Owner.create :name => 'John', :email => 'john@gmail.com', :password => 'foobar123', :password_confirmation => 'foobar123'

    sign_in owner

    owner
  end
end