class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :user_email, :current_user, :user_self, :current_user_check

  private

  def user_email
    @user_email
  end

  def user_self
    @user
  end

  def current_user_check
    if session[:user_id]
      user = User.find_by rid: session[:user_id]

      if user
        @user_email = user.email
        @user = user
      end
    end
  end

  def current_user_with_redirect
    if session[:user_id]
      user = User.find_by rid: session[:user_id]

      if user
        @user_email = user.email
        @user = user
      else
        redirect_to root_url
      end
    else
      redirect_to root_url
    end
  end

end
