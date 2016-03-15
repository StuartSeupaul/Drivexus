class ChangeCorrectFromIntegerToBoolean < ActiveRecord::Migration
  def change
    remove_column :choices, :correct, :integer
    add_column :choices, :correct, :boolean
  end
end
