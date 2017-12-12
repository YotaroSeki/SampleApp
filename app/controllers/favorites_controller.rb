class FavoritesController < ApplicationController
  def create
    @micropost = Micropost.find_by(id: params[:micropost_id])
    current_user.favorite(@micropost)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end

  def destroy
    @micropost = Favorite.find_by(id: params[:id]).micropost
    current_user.cancel_favorite(@micropost)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end
end
