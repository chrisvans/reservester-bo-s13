# Allow running simplecov by running rake like: `simplecov=TRUE rake`
if ENV['simplecov']
  require 'simplecov'
  SimpleCov.start
end

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'shoulda'

class ActiveSupport::TestCase
end

class ActionController::TestCase
  include Devise::TestHelpers

  private

  def create_and_sign_in_owner
    owner = FactoryGirl.create(:owner)

    sign_in owner

    owner
  end

  def setup_bogus_controller_routes!
    begin
      _routes = Rails.application.routes
      _routes.disable_clear_and_finalize = true
      _routes.clear!
      Rails.application.routes_reloader.paths.each{ |path| load(path) }
      _routes.draw do
        match '/:controller(/:action(/:id))'
      end
      ActiveSupport.on_load(:action_controller) { _routes.finalize! }
    ensure
      _routes.disable_clear_and_finalize = false
    end
  end

  def teardown_bogus_controller_routes!
    Rails.application.reload_routes!
  end
end
