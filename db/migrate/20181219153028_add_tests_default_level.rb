class AddTestsDefaultLevel < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tests, :category_id, false
    change_column :tests, :level, :integer, default: 5, null: false
  end
end
