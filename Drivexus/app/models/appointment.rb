class Appointment < ActiveRecord::Base
  belongs_to :student, class_name: "User", foreign_key: "student_id"
  belongs_to :driver

  def apt_display
    apttime = self.time
    apttime.strftime("%A, %d %b %Y %l:%M %p")
  end

end
