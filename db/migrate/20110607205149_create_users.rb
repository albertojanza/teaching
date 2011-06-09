class CreateUsers < ActiveRecord::Migration
  def self.up
  create_table :users do |t|
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string      :remember_token
      t.datetime    :remember_token_expires_at
      t.integer     :status, :default => 0   # 0 --> inactive , 1 --> normal, 2 --> logical removed
      t.timestamps
    end


    add_index :users, :id, :name => 'i_user_pk', :unique => true
    add_index :users, :username, :name => 'i_user_nick_pk', :unique => true
    add_index :users, :email, :name => 'i_user_email_pk', :unique => true


  end

  def self.down
    remove_index(:users,:name => "i_user_pk" )
    remove_index(:users,:name => "i_user_nick_pk" )
    remove_index(:users,:name => "i_user_email_pk" )
    drop_table :users
  end
end
