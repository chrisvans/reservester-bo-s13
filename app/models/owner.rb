class Owner < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  validates :name, :presence => true
  validates :email, :presence => true

  has_many :restaurants

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
  
end
