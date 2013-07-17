FactoryGirl.define do 
	factory :owner do 
	name 'lil wayne'
		sequence(:email) do |n|
			"bestrapper#{n}@alive.com"
		end

		password "foobar12"
		password_confirmation "foobar12"
	end	
end
	