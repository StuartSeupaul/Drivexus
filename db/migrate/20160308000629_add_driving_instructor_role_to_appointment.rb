class AddDrivingInstructorRoleToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :Intructor, :string
  end
end
