class User < Omnisocial::User
  has_many :posts
  has_many :comments

  def prefered_name
    if nickname
      nickname
    elsif from_twitter?
      login
    else
      name
  end
end