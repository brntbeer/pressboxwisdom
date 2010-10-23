module ApplicationHelper
  def facebook_button
    content_tag(:a, image_tag("omnisocial/signin_facebook.png") , :href => auth_request_path(:service => 'facebook'))
  end

  def twitter_button
    content_tag(:a, image_tag("omnisocial/signin_twitter.png") , :href => auth_request_path(:service => 'twitter'))
  end

end
