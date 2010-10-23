class AddUserNickname < ActiveRecord::Migration
  def self.up
    add_column :users, :nickname, :string, :null => true
  end

  def self.down
    remove_column :users, :nickname
  end
end
