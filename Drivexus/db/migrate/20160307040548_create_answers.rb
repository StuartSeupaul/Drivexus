class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :scantron_id
      t.integer :question_id
      t.boolean :correct

      t.timestamps null: false
    end
  end
end
