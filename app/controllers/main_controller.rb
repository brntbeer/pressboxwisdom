class MainController < ApplicationController
  def index
    @posts = Post.find(:all,:order => "created_at DESC", :limit => 10)
  end

  def update_nickname
    current_user.nickname = params[:nickname]
    current_user.save
    flash[:success] = "Nickname Changed!"
  end

end
