class RemoveTimeFromAppointments < ActiveRecord::Migration
  def change
    remove_column :appointments, :time, :datetime
  end
end
