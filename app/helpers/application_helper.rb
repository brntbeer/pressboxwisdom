module ApplicationHelper
  def facebook_button
    content_tag(:a, image_tag("omnisocial/signin_facebook.png") , :href => auth_request_path(:service => 'facebook'))
  end

  def twitter_button
    content_tag(:a, image_tag("omnisocial/signin_twitter.png") , :href => auth_request_path(:service => 'twitter'))
  end

  def heatmap(histogram = {})
    html = %{<div class="span-5 heatmap">}
    _max = histogram.map{|k,v| histogram[k]}.max * 2
    histogram.keys.sort{|a,b| histogram[a] <=> histogram[b]}.reverse.each do |k|
      next if histogram[k] < 1
      _size = (((histogram[k] / histogram.map{|key,val| histogram[key]}.sum.to_f) * 100) - 10).to_i
      _heat = sprintf("%02x" % (255 - (_size * 25)))
      html << %{
        <div class="heatmap_element" style="color: ##{_heat}#{_heat}#{_heat};text-decoration:none; font-size: #{_size}px; height: #{_max+_size}px;"><a href=\"/tag/#{k}\">#{k}</a></div>
      }
    end
    html << %{<br style="clear: both;" /></div>}    
  end

end
