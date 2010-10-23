class User < Omnisocial::User
  has_many :posts
  has_many :comments
end