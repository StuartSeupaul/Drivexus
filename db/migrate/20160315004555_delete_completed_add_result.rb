class DeleteCompletedAddResult < ActiveRecord::Migration
  def change
    remove_column :scantrons, :completed, :boolean
    add_column :scantrons, :result, :float
  end
end
