class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :test_passages, :current_question_id
    add_index :categories, :title, unique: true
  end
end
