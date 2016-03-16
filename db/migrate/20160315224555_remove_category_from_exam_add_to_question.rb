class RemoveCategoryFromExamAddToQuestion < ActiveRecord::Migration
  def change
    remove_column :exams, :category_id, :integer
    add_column :questions, :category_id, :integer
  end
end
