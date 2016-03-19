class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :driver

  def astart_time
    astart_time = start_time.strftime("%I:%M %p")
  end

  def aend_time
    aend_time = end_time.strftime("%I:%M %p")
  end

  def available?(appointment_availability, driver_availability)
     appointment_availability = Appointment.where(:driver_id => self.driver_id, :start_time => self.start_time, :end_time => self.end_time)
     driver_availability = Driver.appointment.where(:driver_id =>self.driver_id, :start_time => self.start_time, :end_time => self.end_time)
     if appointmentAvailability != driver_availability
       true
     else
       false
     end
  end




end
