require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  should have_many :reservations
  should belong_to :owner

  should validate_presence_of(:name)
end
