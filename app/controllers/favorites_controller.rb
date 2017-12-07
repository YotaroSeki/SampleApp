class FavoritesController < ApplicationController
  def create
    micropost = Micropost.find_by(id: params[:micropost_id])
    current_user.favorite(micropost)
    redirect_to current_user
  end

  def destroy
    micropost = Favorite.find_by(micropost_id: params[:id]).micropost
    current_user.cancel_favorite(micropost)
    redirect_to current_user
  end
end
