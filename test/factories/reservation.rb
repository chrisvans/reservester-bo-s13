FactoryGirl.define do
  factory :reservation do
    sequence(:email) do |n| 
      "whattheswag#{n}@lolworld.com" 
    end
    association :restaurant
    message "n*sync was the greatest band of all time"
  end
end