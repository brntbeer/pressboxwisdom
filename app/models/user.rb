class User < Omnisocial::User
  has_many :posts
  has_many :comments

  validates_uniqueness_of :nickname, :allow_blank => true, :allow_nil => true

  def preferred_name
    if nickname
      nickname
    elsif from_twitter?
      login
    else
      name
    end
  end
end