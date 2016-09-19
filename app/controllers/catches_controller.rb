class CatchesController < ApplicationController
  def index
    render json: Catch.where(email: current_user)
  end

  def show
    render json: katch
  rescue ActiveRecord::RecordNotFound
    render json: Errors.for(:not_found), status: :not_found
  end

  def create
    katch = Catch.new(catch_params)

    if katch.save
      katch.create_images #creates job
      render json: katch, status: :created
    else
      render json: Errors.for(:validation_failed, model: katch), status: :unprocessable_entity
    end
  end

  private
  def catch_params
    params.require(:catch).permit(:email, :weight, :length, :species, :lang, :lat, :fish_photo)
  end

  def katch
    Catch.find_by!(email: current_user, id: params[:id])
  end
end
