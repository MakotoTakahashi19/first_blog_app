class UsersController < ApplicationController
  def index

  end
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @emotions = user.emotion.page(params[:page]).per(30).order("created_at desc")
  end
  
  def edit
    

  end

  def update

  end
end
