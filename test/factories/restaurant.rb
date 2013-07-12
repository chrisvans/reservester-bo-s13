FactoryGirl.define do


	factory :restaurant do
		sequence(:name) do |n|
			"J. Pace and Son Location ##{n}"
		end
	association :owner
	end

factory :reservation do
	sequence(:email) do |n|
		"whattheswag#{n}@lolworld.com"
	end
	association :restaurant
	message "LFO was the greatest band of all time"
end

factory :owner do
	name "Yolo Man"
		sequence(:email) do |n|
			"swagdude#{n}@omgmail.com"
		end
	 
	password 'swag2themax'
	password_confirmation 'swag2themax'
end


end