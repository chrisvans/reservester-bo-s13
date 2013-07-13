FactoryGirl.define do
  factory :restaurant do
    sequence(:name) do |n| 
      "J. Pace and Son Location ##{n}" 
    end
    sequence(:address) do |n|
    	"1234 Elm st. Springfield MA"
    end
    sequence(:phone) do |n|
    	"900-444-9089"
    end

    association :owner
  end
end