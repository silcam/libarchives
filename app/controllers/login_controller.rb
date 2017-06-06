class LoginController < ApplicationController

  skip_before_action :require_login

  def login_form
    if params[:coming_from]
      session[:original_request] = params[:coming_from]
    end
  end

  def login
    if params[:password] == Password.password
      session[:logged_in] = true
      go_to_page
    else
      @message = 'The password is incorrect.'
      render 'login_form'
    end
  end

  def logout
    session.delete :logged_in
    redirect_to root_path
  end

  def go_to_page
    if session[:original_request]
      redirect_to session[:original_request]
      session.delete :original_request
    else
      redirect_to root_path
    end
  end

end
