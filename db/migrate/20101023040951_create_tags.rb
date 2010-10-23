class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :tag
      t.timestamps
    end

    create_table :posts_tags, :id => false do |t|
      t.references :tag, :null => false
      t.references :post, :null => false
    end
  end

  def self.down
    drop_table :tags
    drop_table :posts_tags
  end
end