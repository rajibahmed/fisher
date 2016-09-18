class ApplicationController < ActionController::API

  before_action :authenticate

  protected
  def current_user
    parsed_email
  end

  def parsed_email
    request.headers['AUTHORIZATION'].split(' ')[-1] || ""
  end

  def check_header
    request.headers.include?('AUTHORIZATION')
  end

  def authenticate
    check_header || render_unauthorized
  end

  def render_unauthorized
    render json: Errors.for(:not_authorized), status: :unauthorized
  end

end
