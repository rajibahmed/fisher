class CatchesController < ApplicationController
  def index
    render json: Catch.all
  end

  def show
    render nothing: true
  end

  def create
    @catch = Catch.new(catch_params)
  end
end
