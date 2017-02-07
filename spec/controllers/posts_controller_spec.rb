require "spec_helper"
require "rails_helper"

describe PostsController do
  #render_views only: [:show]

  Post.delete_all
  User.delete_all

  before(:all) do

    @user = User.new
    @user.email = "2@2"
    @user.password = "222"
    @user.save

    @post = Post.new
    @post.title = "test"
    @post.text = "test test"
    @post.user =@user
    @post.save
  end

  it "index" do
    get :index
    is_expected.to render_template(:index)
  end

  it "show" do
    session[:user_id] = @user.rid
    get :show, params: {id: @post.id}

    expect(@user.rid).to_not eq(nil)
    expect(response).to have_http_status(:success)

    #expect(response.headers["Content-Type"]).to eq "text/html; charset=utf-8"
    #expect(response.body).to include "Delete Post"
    expect(assigns(:delete)).to eq(true)

    is_expected.to render_template(:show)
  end

  it "create" do
    session[:user_id] = @user.rid
    post :create, params: {post: {title: '123444', text: '123444'}}
    #expect(response).to include("name")

    post = Post.where(user: @user).last
    is_expected.to redirect_to(post_url(post.id))
  end

  it "destroy" do
    session[:user_id] = @user.rid
    delete :destroy, params: {id: @post.id}
    is_expected.to redirect_to(users_posts_url(@user.id))
  end

end