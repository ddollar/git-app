class CreateUsers < ActiveRecord::Migration

  def self.up
    create_table :users do |t|
      t.string  :email,              :null => false
      t.string  :name,               :null => false
      t.string  :encrypted_password, :null => false
      t.string  :salt,               :null => false
      t.text    :ssh_key,            :null => false
      t.boolean :admin,              :null => false, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end

end
