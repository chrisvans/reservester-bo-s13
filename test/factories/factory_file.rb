FactoryGirl.define do
  factory :owner do
    username "Yolo Man"
    sequence(:email) do |n| 
      "swagdude#{n}@omgmail.com"
    end
 
    password 'swag2themax'
    password_confirmation 'swag2themax'
  end

  factory :reservation do
    sequence(:email) do |n| 
      "whattheswag#{n}@lolworld.com" 
    end
    association :restaurant
    message "Cheesecake McBagel"
  end

  factory :restaurant do
    sequence(:name) do |n| 
      "J. Pace and Son Location ##{n}" 
    end
    association :owner
  end
end
