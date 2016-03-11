class AddExamIdToExamQuestions < ActiveRecord::Migration
  def change
    add_column :exam_questions, :question_id, :integer
  end
end
