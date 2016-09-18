class CatchesController < ApplicationController
  def index
    render json: Catch.where(email: current_user)
  end

  def create
    katch = Catch.new(catch_params)

    if katch.save
      katch.create_images
      render json: katch, status: :created
    else
      render json: Errors.for(:validation_failed, model: katch), status: :unprocessable_entity
    end
  end

  private
  def catch_params
    params.require(:catch).permit(:email, :weight, :length, :species, :lang, :lat)
  end
end
