class Microposts::FavoritesController < ApplicationController

  def create
    @micropost = Micropost.find_by(id: params[:micropost_id])
    current_user.favorite(@micropost)
    render json: { message: 'favorite succeed!' }
  rescue => e
    render json: e.message, status: 403
  end

  def destroy
    @micropost = Favorite.find_by(micropost_id: params[:micropost_id]).micropost
    current_user.cancel_favorite(@micropost)
    render json: { message: 'favorite canceled' }
  rescue => e
    render json: e.message, status: 403
  end
end
