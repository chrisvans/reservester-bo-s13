require 'test_helper'

class OwnerTest < ActiveSupport::TestCase
  should have_many(:restaurants)

  should validate_presence_of(:name)
  should validate_presence_of(:email)
  should_not allow_value("omg").for(:email)
  should allow_value("omg@lolmail.com").for(:email)
end
