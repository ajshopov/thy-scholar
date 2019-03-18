class AddProfilePicToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_pic, :json
  end
end
