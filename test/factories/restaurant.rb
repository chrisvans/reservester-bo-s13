FactoryGirl.define do
	factory :restaurant do
		sequence(:restaurant) do |n|
			"J. Pace and Son Location ##{n}"
		end
		association :owner
	end
end