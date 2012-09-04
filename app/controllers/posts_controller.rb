class PostsController < ApplicationController
	def new 
		@post = @blog.new_post
	end

	def create
		@post = @blog.new_post(params[:post])
		@post.publish
		redirect_to :blog_root, notice: "Post added!"
	end

end
