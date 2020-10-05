class FavoritesController < ApplicationController
  def create
    current_user.favorites.create!(travel_id: params[:travel_id])
    @travel = Travel.find(params[:travel_id])
  end

  def destroy
    current_user.favorites.find_by(travel_id: params[:travel_id]).destroy!
    @travel = Travel.find(params[:travel_id])
  end
end
