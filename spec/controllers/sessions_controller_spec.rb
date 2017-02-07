require "spec_helper"
require "rails_helper"

describe SessionsController do
  User.delete_all

  before(:all) do
    @user = User.new
    @user.email = '2@2'
    @user.password = '222'
    @user.save
  end

  it "create" do
    session[:user_id] = nil
    post :create, params: {email: @user.email, password_digest: @user.password}

    user = User.find_by rid: session[:user_id]
    expect(user.email).to eq(@user.email)
    #expect(user.password).to eq(@user.password)

    expect(response).to redirect_to(root_url)
  end

  it "destroy" do
    delete :destroy, params: {id: 'self'}
    expect(session[:user_id]).to eq(nil)
    expect(response).to redirect_to(root_url)
  end

end

