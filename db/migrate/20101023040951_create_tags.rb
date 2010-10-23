class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :tag
      t.timestamps
    end

    create_table :tags_posts, :id => false do |t|
      t.references :tag, :null => false
      t.references :post, :null => false
    end
  end


  def self.down
    drop_table :tags
    drop_table :tags_posts
  end
end