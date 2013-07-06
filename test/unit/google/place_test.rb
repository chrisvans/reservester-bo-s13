require 'test_helper'

module Google
  class PlaceTest < ActiveSupport::TestCase
    setup do
      Google::Place.unstub(:find)
    end

    test "find success" do
      ref = "ref"
      fakeweb_find_place(ref, ["200", "mmmkay"], {:result => {:photos => [ {:photo_reference => 'yolo' } ] } }.to_json)
      place = Google::Place.find(ref)
      assert place.present?
      assert place.photos.present?
      assert_equal ref, place.reference
    end

    test "find not found" do
      ref = "ref"
      fakeweb_find_place(ref, ["404", "sad face"],"sorry bro")
      place = Google::Place.find(ref)
      assert place.nil?
    end

    private

    def fakeweb_find_place(reference, status, body)
      uri = "https://maps.googleapis.com/maps/api/place/details/json?reference=#{reference}&sensor=false&key=AIzaSyCtyfLCGa-gaRzEdiX_20JrMT8esLGnvrE"
      FakeWeb.register_uri(:get, uri, :status => status, :body => body, :content_type => 'application/json') 
    end
  end
end
