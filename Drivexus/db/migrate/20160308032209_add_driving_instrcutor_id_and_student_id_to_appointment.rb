class AddDrivingInstrcutorIdAndStudentIdToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :student_id, :integer
    add_column :appointments, :driving_instructor_id, :integer
  end
end
