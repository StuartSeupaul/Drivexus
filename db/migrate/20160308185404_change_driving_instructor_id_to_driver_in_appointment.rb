class ChangeDrivingInstructorIdToDriverInAppointment < ActiveRecord::Migration
  def change
    rename_column :appointments, :driving_instructor_id, :driver_id
  end
end
