class MainController < ApplicationController
  def index
    @posts = Post.find(:all,:order => "created_at DESC", :limit => 10)
  end

  def update_nickname
    current_user.nickname = params[:nickname]
    if current_user.save
      render :text => '', :status => 200
    else
      render :text => '', :status => 403
    end
  end

end
