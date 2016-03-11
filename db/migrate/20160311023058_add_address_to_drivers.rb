class AddAddressToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :address, :string
  end
end
