class AddNameToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :name, :string, default: "edit profile to add your name"
    change_column :users, :name, :string, null: false, default: ""
  end

  def down
    remove_column :users, :name
  end
end
