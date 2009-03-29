class CreateRepositoryAccesses < ActiveRecord::Migration

  def self.up
    create_table :repository_accesses do |t|
      t.references :repository, :null => false
      t.references :user,       :null => false
      t.boolean    :writable,   :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :repository_accesses
  end

end
