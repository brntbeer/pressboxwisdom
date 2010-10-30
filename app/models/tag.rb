class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts

  def frequency
    self.posts.count
  end

  def self.to_histogram
    unless cloud = Rails.cache.read(:tag_cloud)
      cloud = Tag.all.inject({}){|hash,tag| hash[tag.tag] = tag.frequency; hash}
      Rails.cache.write(:tag_cloud, cloud , :expires_in => 5.minutes)
    end
    cloud
  end
end
