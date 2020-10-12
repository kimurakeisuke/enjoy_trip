class TravelsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_travel, only: %i[edit update destroy]

  def index
    if params[:continent].present?
      # where 与えられた条件にマッチするレコードを全て返す
      @travels = Travel.where(continent: params[:continent]).order(:id)
    elsif params[:area].present?
      @travels = Travel.where(area: params[:area]).order(:id)
    else
      @travels = Travel.order(:id)
    end
    # ユーザーがサインインしていたらお気に入り機能が使えるようになる。
    if user_signed_in?
      @favorited_travel_ids = current_user.favorites.pluck(:travel_id)
    end

    @travels = Travel.page(params[:page]).per(3)
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
    @travel_details = @travel.travel_details.order(:id)
  end

  def edit
    @travel_details = @travel.travel_details.order(:id)
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
    @travel = current_user.travels.find_by(id: params[:id])
  end

  def travel_params
    params.require(:travel).permit(:country, :region, :city, :travel_plan, travel_details_attributes: [:id, :image, :content, :_destroy])
  end
end
