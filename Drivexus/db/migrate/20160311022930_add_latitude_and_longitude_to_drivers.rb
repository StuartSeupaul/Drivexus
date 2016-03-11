class AddLatitudeAndLongitudeToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :latitude, :float
    add_column :drivers, :longitude, :float
  end
end
