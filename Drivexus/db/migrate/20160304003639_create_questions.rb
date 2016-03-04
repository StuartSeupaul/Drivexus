class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :exam_id

      t.timestamps null: false
    end
  end
end
