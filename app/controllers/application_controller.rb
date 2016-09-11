class ApplicationController < ActionController::API

  before_action :authenticate

  def authenticate
    puts request.headers.inspect
  end
end
