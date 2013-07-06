class Owner < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :restaurants

  has_many :restaurants

  validates :name, :email, :presence => true
  validates :email, :email => true
end
