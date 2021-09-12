class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :provider
      t.string :uid
      t.integer :account_id
      t.string :email
      t.string :encrypted_password
      t.string :session_token
      t.string :role
      t.integer :active_session
    end
  end
end
