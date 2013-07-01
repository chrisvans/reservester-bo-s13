require 'carrierwave/test/matchers'
require 'spec_helper'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  before do
    ImageUploader.enable_processing = true
    @uploader = ImageUploader.new(@restaurant, :image)
    @uploader.store!(File.open(path_to_file))
  end

  after do
    ImageUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 300 by 250 pixels" do
      @uploader.thumbnail.should have_dimensions(300, 250)
    end
  end

  context 'the masthead version' do
    it "should scale a landscape image to fit within 600 by 500 pixels" do
      @uploader.masthead.should be_no_larger_than(600, 500)
    end
  end
end