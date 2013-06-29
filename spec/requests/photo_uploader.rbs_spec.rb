require 'spec_helper'

describe "PhotoUploader.rbs" do
  describe "GET /photo_uploader.rbs" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get photo_uploader.rbs_path
      response.status.should be(200)
    end
  end
end
