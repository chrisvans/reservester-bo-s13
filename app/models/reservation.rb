class Reservation < ActiveRecord::Base
  attr_accessible :email, :message, :reserve_on, :restaurant_id, :restaurant

  belongs_to :restaurant

  validates :reserve_on, :presence => true
  validates :email, :presence => true, :email => true
  validate :validate_reserve_on_is_in_the_future, :on => :create


  private

  def validate_reserve_on_is_in_the_future
    if self.reserve_on && self.reserve_on < Time.now
      self.errors.add(:reserve_on, "must be in the future")
    end
  end
end
