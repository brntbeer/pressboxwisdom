class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags
  belongs_to :user
  has_many :comments
end
