class TravelsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_travel, only: %i[show edit update destroy]

  def index
    @travels = Travel.order(:id)
  end

  def new
    @travel = Travel.new
    @travel.travel_details.build
  end

  def create
    travel = current_user.travels.create!(travel_params)
    redirect_to travel
  end

  def show
    @travel = Travel.find(params[:id])
  end

  def edit
  end

  def update
    @travel.update!(travel_params)
    redirect_to @travel
  end

  def destroy
    @travel.destroy!
    redirect_to @travel
  end

  private

  def set_travel
    @travel = Travel.find(params[:id])
  end

  def travel_params
    params.require(:travel).permit(:country, :location, :travel_plan, travel_details_attributes: [:image, :content, :_destroy])
  end
end
