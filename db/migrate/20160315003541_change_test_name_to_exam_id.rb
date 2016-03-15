class ChangeTestNameToExamId < ActiveRecord::Migration
  def change
    remove_column :grades, :test_name, :string
    add_column :grades, :exam_id, :integer
  end
end
