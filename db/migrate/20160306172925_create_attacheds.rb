class CreateAttacheds < ActiveRecord::Migration
  def change
    create_table :attacheds do |t|
      t.integer :question_id
      t.integer :exam_id

      t.timestamps null: false
    end
  end
end
