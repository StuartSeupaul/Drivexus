class CreateExamQuestions < ActiveRecord::Migration
  def change
    create_table :exam_questions do |t|
      t.string :content
      t.integer :exam_id

      t.timestamps null: false
    end
  end
end
