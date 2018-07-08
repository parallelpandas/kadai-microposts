class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost=Micropost.find(params[:micropost_id])
    current_user.create_like(micropost)
    flash[:success]='いいね！しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost=Micropost.find(params[:micropost_id])
    current_user.destroy_like(micropost)
    flash[:success]='いいね！を解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
