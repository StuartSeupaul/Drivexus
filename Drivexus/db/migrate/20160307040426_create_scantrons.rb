class CreateScantrons < ActiveRecord::Migration
  def change
    create_table :scantrons do |t|
      t.integer :user_id
      t.integer :exam_id

      t.timestamps null: false
    end
  end
end
