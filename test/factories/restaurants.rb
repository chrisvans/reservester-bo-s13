FactoryGirl.define do 
	factory :restaurant do 
		sequence(:name) do |n|
			name 'yolo sequence ##{n}'
		end
		association :owner
	end
end
