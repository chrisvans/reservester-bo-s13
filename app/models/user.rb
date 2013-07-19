class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :is_owner

  has_many :restaurants
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
end
