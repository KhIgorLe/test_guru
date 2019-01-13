class DropTableResults < ActiveRecord::Migration[5.2]
  def up
    drop_table :results, if_exists: true
  end

  def down
    create_table :results do |t|
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false
      t.boolean :completed, null: false, default: false

      t.timestamps

      t.index %i[user_id test_id], unique: true
    end
  end
end
