class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts

  def frequency
    self.posts.count
  end

  def self.to_histogram
    Tag.all.inject({}){|hash,tag| hash[tag.tag] = tag.frequency; hash}
  end
end
