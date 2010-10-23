class MainController < ApplicationController
  def index
    @posts = Post.find(:all,:order => "created_at DESC", :limit => 10)
  end
end
