class LoginController < ApplicationController


  def login_form

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

  def go_to_page
    if session[:original_request]
      redirect_to session[:original_request]
    else
      redirect_to root_path
    end
  end

end
