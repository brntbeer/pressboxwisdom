class MainController < ApplicationController
  def index
    @posts = Post.find(:all,:order => "created_at DESC", :limit => 10)
  end

  def tags
    @tag = params[:tag] || ""
    tag = Tag.where(:tag => @tag ).first
    if tag
      @posts = tag.posts
    else
      @posts = []
    end
  end

  def update_nickname
    current_user.nickname = params[:nickname] unless params[:nickname] == "" 
    if current_user.save && params[:nickname] != ""
      render :text => '', :status => 200
    else
      render :text => '', :status => 403
    end
  end

end
