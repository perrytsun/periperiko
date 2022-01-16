class LikesController < ApplicationController

    def create
      like = current_user.likes.create(test_id: params[:test_id])
      redirect_back(fallback_location: test_likes_path)
    end
  
    def destroy
      like = Like.find_by(test_id: params[:test_id], user_id: current_user.id)
     
      redirect_back(fallback_location: test_likes_path)
    end
  
  end