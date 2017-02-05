class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def create
    user = User.find_by email: params[:email]

    if user
      if user.password == params[:password]
        session[:user_id] = user.rid
        redirect_to root_url
      else
        flash.now[:error] = "not correct password or email"
        render 'new'
      end
    else
      flash.now[:error] = "not correct password or email"
      render 'new'
    end
  end

end
