class TravelsController < ApplicationController
  before_action :set_travel, only: %i[show edit update destroy]

  def index
    @travels = Travel.order(:id)
  end

  def new
    @travel = Travel.new
  end

  def create
    travel = Travel.create!(travel_params)
    redirect_to travel
  end

  def show
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
    params.require(:travel).permit(:country, :location, :travel_plan)
  end
end
