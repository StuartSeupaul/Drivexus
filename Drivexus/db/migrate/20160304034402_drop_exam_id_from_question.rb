class DropExamIdFromQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :exam_id
  end
end
