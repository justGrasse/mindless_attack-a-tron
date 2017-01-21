class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :access_token, null: false
      t.string :oauth_id, null: false
      t.timestamp :expires_at, null: false

      t.timestamps null: false
    end
  end
end
