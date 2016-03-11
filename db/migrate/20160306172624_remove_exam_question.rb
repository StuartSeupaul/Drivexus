class RemoveExamQuestion < ActiveRecord::Migration
  def change
    drop_table :exams_questions
  end
end
