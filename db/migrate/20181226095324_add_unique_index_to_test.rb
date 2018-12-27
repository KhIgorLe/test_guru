class AddUniqueIndexToTest < ActiveRecord::Migration[5.2]
  def change
    add_index :tests, %i[title level], unique: true
    add_index :answers, %i[body question_id], unique: true
    add_index :questions, %i[body test_id], unique: true
  end
end
