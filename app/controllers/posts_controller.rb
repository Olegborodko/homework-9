class PostsController < ApplicationController
	before_action :current_user_with_redirect, only: [:new, :create, :destroy, :users_posts]

	def index
		@posts = Post.all
				
	end

	def show
		@post = Post.find params[:id]

		if current_user_check == @post.user
			@delete = true
		end
	end

	def create
		post = Post.new(person_params)
		post.user = user_self

		if post.save
			redirect_to post_url(post.id), :notice => "Success"
		else
			flash.now[:error] = post.errors.full_messages
			render :new
		end
	end

	def destroy
		post = Post.find params[:id]

		if post.destroy
			redirect_to  users_posts_url(user_self.id), :notice => "Success"
		else
			render :show
		end

	end

	def users_posts
		@posts = Post.where(user: user_self)
  	render :index
	end

	private
	def person_params
		params.require(:post).permit(:title, :text)
	end
end
