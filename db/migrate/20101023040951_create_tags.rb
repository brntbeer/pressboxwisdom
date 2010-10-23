class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :tag
      t.timestamps
    end

    create_table :tags_posts, :id => false do |t|
      t.integer :tag_id, :null => false
      t.integer :post_id, :null => false
    end
  end


  def self.down
    drop_table :tags
    drop_table :tags_posts
  end
end