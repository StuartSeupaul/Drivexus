class AddPhotoToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :photo, :string

  end
end
