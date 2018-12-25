class AddAuthorToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :author, foreign_key: { to_table: :users }

    user_id = User.find_by(name: 'Игорь')&.id
    Test.update_all(author_id: user_id)

    change_column_null :tests, :author_id, false
  end
end
