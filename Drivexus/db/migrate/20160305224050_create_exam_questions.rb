class CreateExamQuestions < ActiveRecord::Migration
  def change
    create_table :exam_questions do |t|

      t.timestamps null: false
    end
  end
end
