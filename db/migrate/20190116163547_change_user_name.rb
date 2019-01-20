class ChangeUserName < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:users, :name, true )

    rename_column :users, :name, :first_name

    add_column :users, :last_name, :string
    add_column :users, :type, :string, null: false, default: "User"

    add_index :users, :type
  end
end
