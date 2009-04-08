class CreateRepositories < ActiveRecord::Migration

  def self.up
    create_table :repositories do |t|
      t.string  :name,        :null => false
      t.string  :description, :null => false
      t.boolean :public,      :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :repositories
  end

end
