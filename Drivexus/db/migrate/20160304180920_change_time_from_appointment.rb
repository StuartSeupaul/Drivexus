class ChangeTimeFromAppointment < ActiveRecord::Migration
  def change
     change_column :appointments, :time, :datetime
  end
end
