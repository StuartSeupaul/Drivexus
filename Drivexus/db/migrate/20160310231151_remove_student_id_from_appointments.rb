class RemoveStudentIdFromAppointments < ActiveRecord::Migration
  def change
    remove_column :appointments, :student_id, :integer
  end
end
