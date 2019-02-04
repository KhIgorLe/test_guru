class AddTimeToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :time, :integer, default: 30, null: false
  end
end
