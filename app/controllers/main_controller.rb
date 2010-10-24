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

  def new_post
    if current_user
      p = Post.create
      p.post_body = params[:body]
      p.title = params[:title]
      params[:tags].split(",").each do |tag|
        p.tags << Tag.find_or_create_by_tag(tag)
      end
      p.user = current_user
      p.save
      flash[:success] = "Post added!"
      index
      render :action => :index
    else
      flash[:error] = "Forbidden, you must be logged in to post"
      render :index
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
