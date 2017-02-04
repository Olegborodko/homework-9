class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :user_email

  private

  def current_user
    if session[:user_id]
      user = User.find_by rid: session[:user_id]
        @user_email = user.email
    end
  end

  def user_email
    @user_email
  end
end
