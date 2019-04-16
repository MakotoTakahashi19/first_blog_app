class EmotionsController < ApplicationController

  before_action :move_to_index , except: :index

  def index
    @emotions = Emotion.all.includes(:user).page(params[:page]).per(30).order("created_at desc")
  end

  def show
    @emotions = Emotion.find(params[:id])
  end
  
  def new
  end
  
  def create
    Emotion.create(text: emotion_params[:text], emotion: emotion_params[:emotion], user_id: current_user.id)
    redirect_to controller: "emotions", action: "index"
  end
  
  def edit
    @emotion = Emotion.find(params[:id])
  end
  
  def update
    emotion = Emotion.find(params[:id])
    emotion.update(emotion_params) if emotion.user_id == current_user.id
    redirect_to controller: "emotions", action: "index"

  end
  
  def destroy
    emotion = Emotion.find(params[:id])
    emotion.destroy if emotion.user_id == current_user.id
    redirect_to controller: "emotions", action: "index"

  end

  private
  def emotion_params
    params.permit(:text, :emotion)
  end

  def move_to_index
    redirect_to controller: "emotions", action: "index" unless user_signed_in?
  end
end
