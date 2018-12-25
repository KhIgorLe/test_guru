class AddUniqueIndexToResults < ActiveRecord::Migration[5.2]
  def change
    add_index :results, %i[user_id test_id], unique: true
  end
end
