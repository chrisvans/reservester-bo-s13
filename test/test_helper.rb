ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase


	include Devise::TestHelpers

end 	

private
	
def create_and_sign_in_owner

	owner = Owner.create name: "Josh", email: "josh@gmail", password: "password123", password_confirmation: "password123"

	sign_in owner

	owner
end
