class FavoritesController < ApplicationController
  def create
    @travel = Travel.find(params[:travel_id])
    current_user.favorites.create!(travel_id: params[:travel_id])
  end

  def destroy
    @travel = Travel.find(params[:travel_id])
    current_user.favorites.find_by(travel_id: params[:travel_id]).destroy!
  end
end
