class CatchesController < ApplicationController
  def index
    render json: Catch.where(email: current_user)
  end

  def show
    katch = Catch.find(params[:id])
    render json: katch, status: :created
  rescue ActiveRecord::RecordNotFound
    render json: Errors.for(:not_found), status: :not_found
  end

  def create
    katch = Catch.new(catch_params)

    if katch.save
      render json: katch, status: :created
    else
      render json: Error.for(katch), status: :unprocessable_entity
    end
  end

  private
  def catch_params
    params.permit(:email, :height, :lenght, :species, :lang, :lat)
  end
end
