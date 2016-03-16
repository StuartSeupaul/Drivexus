class AddCategoryIdToExam < ActiveRecord::Migration
  def change
    add_column :exams, :category_id, :integer
  end
end
