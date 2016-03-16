class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :driver

  def apt_time
    apt_time = time.strftime("%I:%M %p")
  end


end
