class ApplicationController < ActionController::API

  before_action :authenticate

  protected
  def current_user
    auth_param
  end

  def auth_param
    request.headers['AUTHORIZATION'].split(' ')[-1] || ""
  end

  def check_header
    request.headers.include?('AUTHORIZATION')
  end

  def authenticate
    check_header || render_unauthorized
  end

  def render_unauthorized
    render json: 'Bad credentials', status: 401
  end

end
