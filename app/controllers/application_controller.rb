class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def authenticate_user
    if !user_signed_in?
      redirect_to login_path
    end
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless user_signed_in?
      store_location
      flash[:alert] = "Please log in."
      redirect_to login_path
    end
  end
end
