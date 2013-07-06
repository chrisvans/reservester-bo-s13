FactoryGirl.define do
  factory :reservation do
    sequence(:email) do |n| 
      "whattheswag#{n}@lolworld.com" 
    end
    association :restaurant
    message "LFO was the greatest band of all time"
    reserve_on Time.now + 10.minutes
  end
end
