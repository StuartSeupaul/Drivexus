class RemoveContentFromExamQuestions < ActiveRecord::Migration
  def change
    remove_column :exam_questions, :content
  end
end
