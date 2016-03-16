class Driver < ActiveRecord::Base
  has_many :appointments
  has_many :users, through: :appointments

  geocoded_by :address
  after_validation :geocode
end
