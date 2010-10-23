Omnisocial.setup do |config|
  if Rails.env.production?
    # Configs for live, production twitter and facebook apps
    config.twitter ENV['TWITTER_KEY'],ENV['TWITTER_SECRET']
    config.facebook ENV['FACEBOOK_API'],ENV['FACEBOOK_SECRET']

  elsif Rails.env.development?
    # Configs for testing apps
    config.twitter ENV['TWITTER_KEY'],ENV['TWITTER_SECRET']
    config.facebook ENV['FACEBOOK_API'],ENV['FACEBOOK_SECRET']
  end
end

