class MainController < ApplicationController
  def index
    @posts = Post.find(:all,:order => "created_at DESC", :limit => 10)
  end

  def userposts
    @userid = params[:user] || -1
    user = User.where(:id => @userid).first
    if user
      @posts = user.posts
      @username = user.preferred_name
    else
      @posts = []
      flash[:error] = "Invalid Userid"
    end
  end

  def tags
    tag = params[:tag] || ""
    @tag = Tag.where(:tag => tag).first
    if(@tag)
      @posts = @tag.posts
      @tag = @tag.tag
    else
      flash[:error] = "Tag Does Not Exist"
      @posts = []
      @tag = tag
    end
    render :tagid
  end

  def tagid
    tagid = params[:tagid] || -1 
    tag = Tag.where(:id => tagid ).first
    if tag
      @posts = tag.posts
      @tag = tag.tag
    else
      flash[:error] = "Tag Does Not Exist"
      @posts = []
      @tag = ""
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
