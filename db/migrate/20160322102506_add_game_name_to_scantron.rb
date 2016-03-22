class AddGameNameToScantron < ActiveRecord::Migration
  def change
    add_column :scantrons, :game_name, :string
  end
end
