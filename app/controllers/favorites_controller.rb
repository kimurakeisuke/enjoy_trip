class FavoritesController < ApplicationController
  def create
    current_user.favorites.create!(travel_id: params[:travel_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.favorites.find_by(travel_id: params[:travel_id]).destroy!
    redirect_back(fallback_location: root_path)
  end
end
