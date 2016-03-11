class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.string :time
      t.string :datetime
      t.text :description

      t.timestamps null: false
    end
  end
end
