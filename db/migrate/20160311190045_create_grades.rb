class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :student_id
      t.string :test_name
      t.integer :result

      t.timestamps null: false
    end
  end
end
