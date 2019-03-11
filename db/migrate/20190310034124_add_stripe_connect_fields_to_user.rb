class AddStripeConnectFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :stripe_id, :string
    add_column :users, :stripe_access_key, :string
    add_column :users, :stripe_publishable_key, :string
    add_column :users, :stripe_refresh_token, :string
  end
end
