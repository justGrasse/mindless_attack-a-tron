class UpdateUserTableToIncludeFacebookId < ActiveRecord::Migration
  def change
    add_column :users, :facebook_id, :integer, null: false
    remove_column :users, :expires_at
    add_column :users, :expires_at, :integer
    remove_column :users, :oauth_id
  end
end
