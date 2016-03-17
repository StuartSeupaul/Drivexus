class AddEndTimeToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :end_time, :time
  end
end
