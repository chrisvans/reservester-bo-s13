require 'test_helper'

class Google::PhotosControllerTest < ActionController::TestCase
  test "success" do
    ref = "ref"
    fakeweb_photo_grab(ref)
    get :show, :id => ref
    assert_response :success
  end

  test "not found" do
    ref = "ref"
    fakeweb_photo_grab(ref, ["404", "not found"])
    get :show, :id => ref
    assert_response :not_found
  end
end
