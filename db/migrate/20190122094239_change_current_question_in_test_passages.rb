class ChangeCurrentQuestionInTestPassages < ActiveRecord::Migration[5.2]
  def up
    remove_column :test_passages, :current_question_id
    add_column :test_passages, :current_question_id, :integer
    add_foreign_key :test_passages, :questions, column: :current_question_id
  end

  def down
    remove_column  :test_passages, :current_question_id
    add_reference  :test_passages, :current_question, foreign_key: true
  end
end
