class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      flash.now[:notice] = "Signed in successfully"
      forwarding_url = session[:forwarding_url]
      reset_session
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      session[:session_token] = user.session_token
      redirect_to forwarding_url || user
    else
      flash.now[:alert] = "Invalid email/password combination"
      render "new"
    end
  end

  def destroy
    log_out if user_signed_in?
    redirect_to root_url
  end
end
