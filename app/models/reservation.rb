class Reservation < ActiveRecord::Base
  attr_accessible :name, :email, :requested_datetime, :message, :restaurant

  belongs_to :restaurant

  validates :email, presence: true
  validates :requested_datetime, presence: true

# FactoryGirl.define do
#   factory :reservation do
#     sequence(:email) do |n| 
#       "whattheswag#{n}@lolworld.com" 
#     end
#     association :restaurant
#     message "LFO was the greatest band of all time"
#   end
# end

end
