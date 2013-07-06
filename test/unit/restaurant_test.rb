require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  should have_many :reservations
  should belong_to :owner

  should validate_presence_of(:name)

  teardown do
    Google::Place.unstub(:find)
  end

  test "google_place for a restaurant with no google_id" do
    restaurant = FactoryGirl.create(:restaurant, :google_id => nil)
    assert_nil restaurant.google_place
  end

  test "google_place for a restaurant that google place lookup fails" do
    Google::Place.expects(:find).with("yolo").once.returns(nil)
    restaurant = FactoryGirl.create(:restaurant, :google_id => "yolo")
    assert_nil restaurant.google_place
  end

  test "google_place lookup for a legit google_place" do
    place = Google::Place.new(
      :reference => 'yolo',
      :photos    => [
        "google/photos/1"
      ]
    )
    Google::Place.expects(:find).with("yolo").once.returns(place)
    restaurant = FactoryGirl.create(:restaurant, :google_id => "yolo")
    assert_equal place, restaurant.google_place
  end
end
