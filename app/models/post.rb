class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags
  belongs_to :user
  has_many :comments
  validates_presence_of :post_body, :title
end
