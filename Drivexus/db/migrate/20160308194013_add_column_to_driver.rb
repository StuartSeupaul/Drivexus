class AddColumnToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :driver_id, :integer
    add_column :drivers, :name, :string
    add_column :drivers, :bio, :text
  end
end
