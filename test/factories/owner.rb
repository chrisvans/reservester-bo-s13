FactoryGirl.define do
	factory :owner do
		name "Yolo Man"
		sequence(:email) do |n|
			"swagdude#{n}@omgmail.com"
		end
 
		password 'swag2themax'
		password_confirmation 'swag2themax'
	end
end