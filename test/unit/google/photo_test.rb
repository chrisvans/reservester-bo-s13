require 'test_helper'

module Google
  class PhotoTest < ActiveSupport::TestCase
    test "find success" do
      fakeweb_photo_grab("ref")
      photo = Google::Photo.find("ref")
      assert photo.present?
      assert photo.response.body.present?
    end

    test "find 404" do
      fakeweb_photo_grab("ref", ["404", "Not Found"])
      photo = Google::Photo.find("ref")
      assert photo.nil?
    end

    private

  end
end
