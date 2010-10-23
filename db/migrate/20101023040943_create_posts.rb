class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.references :user
      t.string :title
      t.string :video_link, :null => true
      t.text :post_body
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
