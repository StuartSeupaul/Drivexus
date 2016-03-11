class ChangeBioTypeToDriver < ActiveRecord::Migration
  def change
    change_column :drivers, :bio, :string
  end
end
