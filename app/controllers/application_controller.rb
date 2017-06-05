class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception

  before_action :require_login

  private

  def require_login
    unless logged_in?
      session[:original_request] = request.path
      redirect_to '/login'
    end
  end
end
