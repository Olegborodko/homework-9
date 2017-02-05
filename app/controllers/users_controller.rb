class UsersController < ApplicationController

  def create
    user = User.new(person_params)
    if user.save
      session[:user_id] = user.rid
      redirect_to root_url, :notice => "Signed up!"
    else
      flash.now[:error] = user.errors.full_messages
      render :new
    end
  end

  private
  def person_params
    params.require(:user).permit(:email, :age, :password_digest, :description)
  end
end
