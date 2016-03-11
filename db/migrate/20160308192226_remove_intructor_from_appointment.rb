class RemoveIntructorFromAppointment < ActiveRecord::Migration
  def change
    remove_column :appointments, :Intructor, :string
  end
end
