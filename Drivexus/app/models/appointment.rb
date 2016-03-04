class Appointment < ActiveRecord::Base
  resourcify
  belongs_to :user
end
