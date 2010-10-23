class AddIndex < ActiveRecord::Migration
  def self.up
    add_index :users, :id
    add_index :tags, :id
    add_index :tags, :tag
    add_index :posts, :id
  end

  def self.down
    remove_index :users, :id
    remove_index :tags, :id
    remove_index :tags, :tag
    remove_index :posts, :id
  end
end
