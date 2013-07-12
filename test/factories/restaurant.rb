FactoryGirl.define do
  factory :restaurant do
    sequence(:name) do |n| 
      "J. Pace and Son Location ##{n}" 
    end
    association :owner
  end
end