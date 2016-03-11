class AddCompletedToScantron < ActiveRecord::Migration
  def change
    add_column :scantrons, :completed, :boolean
  end
end
